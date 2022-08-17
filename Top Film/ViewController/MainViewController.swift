//
//  ViewController.swift
//  Top Film
//
//  Created by Maks on 05.06.2022.
//

import UIKit
import SDWebImage

protocol MainViewControllerProtocol: AnyObject {
    func updateInterfaceWith()
}

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var presenter: MainPresenterProtocol!
    
    private let segueIdentifier = "showDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter = MainPresenter(view: self)
        presenter.filmsInfoDataView()
    }
    //    The number of lines is equal to the number of elements of the object
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRowsCount()
    }
    
    //    Cell configuration
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell
        let film = presenter.getFilm(for: indexPath.row)
        cell.updateInterface(film: film)
        return cell
    }
    
    //  Dynamic cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //    Transition to SecondViewController by segue.identifier
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let film = presenter.getFilm(for: indexPath.row)
            let secondVC = segue.destination as! DetailsViewController
            secondVC.setupPresenter(film: film)
        }
    }
}

extension MainViewController: MainViewControllerProtocol {
    //    Interface update
    func updateInterfaceWith() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

