//
//  StatementsWorker.swift
//  ListaZap
//
//  Created by Romulo Oliveira Viganico on 27/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation
import Alamofire

protocol StatementsWorkerProtocol {
    func get(_ onSucess: @escaping (StatementList) -> Void, _ onError: @escaping (String) -> Void)
}

class StatementsWorker: StatementsWorkerProtocol {
    var list: StatementList?
    
    var apiClient: ApiClient?
    
    init() {
        apiClient = ApiManager()
    }
    
    func get(_ onSuccess: @escaping (StatementList) -> Void, _ onError: @escaping (String) -> Void) {
        
//        let params: [String: Any] = [
//            "user" : "user",
//            "password" : "password"
//        ]
//
//        print("Parametros \(params)")
        
        apiClient?.request(type: StatementResponse.self,
                           endpoint: "statements/1",
                           method: HTTPMethod.get,
//                           parameters: params,
                           encoding: URLEncoding.default,
                           onSuccess: {response in
                            if let error = response.error.message{
                                print("error dados invalidos \(error)")
                                onError(error)
                                return
                            }
                            onSuccess(response.statementList)},
                           onError: { error in
                            //tratar error, por exemplo quando estiver sem internet (ver qual codigo)
                            onError("Ocorreu um error :(")
        })
    }
}
