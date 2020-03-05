//
//  StatementResponse.swift
//  ListaZap
//
//  Created by Romulo Oliveira Viganico on 27/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation

struct StatementResponse: Decodable {
    let statementList: [StatementList]
    let error: ErrorResponse
}

struct StatementList: Decodable {
    let title: String?
    let desc: String?
    let date: String?
    let value: Double?
}

//    {
//        "title": "TED Recebida",
//        "desc": "Salário",
//        "date": "2018-08-21",
//        "value": 1400.5
//    }
//],
//"error": {}
