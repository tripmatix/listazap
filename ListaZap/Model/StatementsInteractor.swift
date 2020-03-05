//
//  StatementsInteractor.swift
//  ListaZap
//
//  Created by Romulo Oliveira Viganico on 27/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation

protocol StatementsBusinessLogic {
    func get()
}

class StatementsInteractor: StatementsBusinessLogic {
    var lista: StatementList?
    
    var worker: StatementsWorkerProtocol?
    
    init() {
        worker = StatementsWorker()
    }
    
    func get(){
        print("git2")
        worker?.get({ StatementList in
            self.lista = StatementList
            print("lista: \(StatementList)")
        }, { errorMessage in
            print("showMessageError2: \(errorMessage)")
        })
    }
}


