//
//  ApiClient.swift
//  ListaZap
//
//  Created by Romulo Oliveira Viganico on 24/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation
import Alamofire
protocol ApiClient {
    func request<T: Decodable>(
        type: T.Type,
        endpoint: String,
        method: HTTPMethod,
        encoding: ParameterEncoding,
        onSuccess: @escaping (T) -> Void,
        onError: @escaping (Error) -> Void)
}

class ApiManager: ApiClient {
    func request<T: Decodable>(type: T.Type,
                               endpoint: String,
                               method: HTTPMethod,
                               encoding: ParameterEncoding,
                               onSuccess: @escaping (T) -> Void,
                               onError: @escaping (Error) -> Void) {
        let baseUrl="https://bank-app-test.herokuapp.com/api/"
        
//        let request = AF.request (baseUrl + endpoint, method: method, parameters: parameters, encoding: encoding)
        let request = AF.request (baseUrl + endpoint, method: method, encoding: encoding)
        request.validate(statusCode: 200..<300)
        request.responseJSON { response in
            #if DEBUG
            print("request")
            print(request)
            print("response")
            print(response)
            #endif
            
            switch(response.result) {
            case .success:
                do {
                    print("sucess1")
                    let parsedJson = try JSONDecoder().decode(T.self, from: response.data!)
                    onSuccess(parsedJson)
                } catch let error {
                    print("error1 \(error)")
                    onError(error)
                }
            case .failure(let error):
                onError(error)
            }
        }
        
    }
}
