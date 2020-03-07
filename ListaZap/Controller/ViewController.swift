//
//  ViewController.swift
//  ListaZap
//
//  Created by Romulo Oliveira Viganico on 24/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblData: UITableView!
    
    var lista: [StatementList] = []
    
    let repository = StatementsRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repository.getStatements(onSuccess: { statements  in
            self.lista = statements
            self.tblData?.reloadData()
        }) { error in
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("print2 \(lista)")
        return lista.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = lista[indexPath.row]
        cell.textLabel?.text = item.title
        return cell
    }
    
}
