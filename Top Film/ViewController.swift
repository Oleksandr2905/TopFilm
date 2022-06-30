//
//  ViewController.swift
//  Top Film
//
//  Created by Maks on 05.06.2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var film = [Result]()
    var parsingFilms = ParsingFilms()
    let customTableViewCell = CustomTableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        parsingFilms.filmsInfo() { data in
            self.film = data
            self.updateInterfaceWith()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return film.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.titleLabel.text = film[indexPath.row].originalTitle
        cell.overviewLabel.text = film[indexPath.row].overview
        cell.dateLabel.text = "Release: " + film[indexPath.row].releaseDate
        
        let imageOfFilmURL = "https://image.tmdb.org/t/p/"+"w500"+film[indexPath.row].posterPath
        guard let url = URL(string: imageOfFilmURL) else { return cell }
        cell.imageOfFilm.sd_setImage(with: url, completed: nil)
        cell.imageOfFilm.layer.cornerRadius = 10
        cell.imageOfFilm.clipsToBounds = true
        return cell
    }
    
//  Динамічна висота комірки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
//    Оновлення інтерфейсу
    func updateInterfaceWith() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
//    Перехід на SecondViewController по segue.identifier
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let film = film[indexPath.row]
            let secondVC = segue.destination as! SecondViewController
            secondVC.currentFilms = film
        }
    }
    
//    Скидання виділення вибраної комірки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
