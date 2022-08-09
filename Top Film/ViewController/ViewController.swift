//
//  ViewController.swift
//  Top Film
//
//  Created by Maks on 05.06.2022.
//

import UIKit
import SDWebImage

protocol ViewControllerProtocol: AnyObject {
    func updateInterfaceWith()
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewPresenter: ViewPresenterProtocol!
          
    private let segueIdentifier = "showDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewPresenter = ViewPresenter(view: self)
        viewPresenter.filmsInfoDataView()
    }
//    The number of lines is equal to the number of elements of the object
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewPresenter.getRowsCountAt()
    }
    
//    Cell configuration
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.updateInterface(film: viewPresenter.configure()[indexPath.row])
        return cell
    }
    
    //  Dynamic cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //    Interface update
    func updateInterfaceWith() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //    Transition to SecondViewController by segue.identifier
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let film = viewPresenter.configure()[indexPath.row]
            let secondVC = segue.destination as! SecondViewController
            secondVC.currentFilms = film
        }
    }
}
    
extension ViewController: ViewControllerProtocol {
        
}

