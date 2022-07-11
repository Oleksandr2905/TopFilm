//
//  ViewController.swift
//  Top Film
//
//  Created by Maks on 05.06.2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var film = [Result]()
    private var parsingFilms = ParsingFilms()
    private let segueIdentifier = "showDetail"
    private let constants = Constants()
    private let filmsInfo = FilmsInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        filmsInfo.filmsInfo() { [weak self] data in
            self?.film = data!
            self?.updateInterfaceWith()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return film.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.updateInterface(film: film[indexPath.row])
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
            let film = film[indexPath.row]
            let secondVC = segue.destination as! SecondViewController
            secondVC.currentFilms = film
        }
    }
}
