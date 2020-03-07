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
    
    var lista: [StatementList]?
    
    var worker: StatementsWorkerProtocol?
    
    init() {
        worker = StatementsWorker()
        view = ViewController()
    }
    
    func get(){
        worker?.get({ StatementList in
            self.lista = StatementList
            print("sucess interactor)")
            self.view?.displayStatements(lista: self.lista!)
        }, { errorMessage in
            print("showMessageError: \(errorMessage)")
        })
    }
}


