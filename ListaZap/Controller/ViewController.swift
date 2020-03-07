//
//  ViewController.swift
//  ListaZap
//
//  Created by Romulo Oliveira Viganico on 24/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import UIKit
import Alamofire

protocol ViewControllerDisplay {
    func displayStatements(lista: [StatementList])
}

//class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
class ViewController: UIViewController, ViewControllerDisplay, UITableViewDataSource {

    
    var interactor: StatementsBusinessLogic?
    
    @IBOutlet weak var tblData: UITableView!
    
    var worker: StatementsWorkerProtocol?
    
    var lista: [StatementList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        print("inicio setup")
        let vc = self
        let interactor = StatementsInteractor()
        vc.interactor = interactor
        interactor.get()
        print("fim setup")
        
    }
    
    func displayStatements(lista: [StatementList]) {
        print("print1 \(lista)")
        self.lista = lista
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("print2 \(lista)")
        return lista!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.lista![indexPath.row]
        
        return cell
    }
    
}
