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
    
    var view: ViewControllerDisplay?
    
    var worker: StatementsWorkerProtocol =  StatementsWorker()
    
    init(_ vc: ViewControllerDisplay) {
        self.view = vc
    }
    
    func get(){
        worker.get({ StatementList in
            print("sucess interactor)")
            self.view?.displayStatements(lista: StatementList)
        }, { errorMessage in
            print("showMessageError: \(errorMessage)")
        })
    }
}


