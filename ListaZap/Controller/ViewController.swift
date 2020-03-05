//
//  ViewController.swift
//  ListaZap
//
//  Created by Romulo Oliveira Viganico on 24/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import UIKit
import Alamofire

//class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
class ViewController: UIViewController {

    
    var interactor: StatementsBusinessLogic?
    
    @IBOutlet weak var tblData: UITableView!
    
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
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
}
