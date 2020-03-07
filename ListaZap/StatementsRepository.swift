//
//  StatementsRepository.swift
//  ListaZap
//
//  Created by Lucas Modesto on 07/03/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation
import Alamofire

protocol StatementsDataSource {
    func getStatements( onSuccess: @escaping ([StatementList]) -> Void ,onError: @escaping (String) -> Void )
}

class StatementsRepository: StatementsDataSource {
    
    private let apiClient = ApiManager()
    
    func getStatements(onSuccess: @escaping ([StatementList]) -> Void, onError: @escaping (String) -> Void) {
               apiClient.request(type: StatementResponse.self,
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
