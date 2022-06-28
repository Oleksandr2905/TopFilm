//
//  ViewController.swift
//  Top Film
//
//  Created by Maks on 05.06.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    @IBOutlet var tableView: UITableView!
        
    var film = [Result]()
    var parsingFilms = ParsingFilms()

    
//    let film = [Result(
//                       backdropPath: "Ремінісценція",
//                       id: 23,
//                       originalTitle: "Ремінісценція",
//                       overview: "У центрі сюжетної лінії виявляється  Пентагоні. Здаватися Коллінз не збирається. Наразі найкращим рішенням стає повернення додому. Плани зненацька зриваються. На базу вчинено напад. Якщо не спробувати дати ворогам відсіч, то ядерна зброя",
//                       posterPath: "Ремінісценція",
//                       releaseDate: "23.07.2021",
//                       voteAverage: 8.2)]
//

    let customTableViewCell = CustomTableViewCell()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        parsingFilms.filmsInfo() { [weak self] film in
//            self?.film = data
            guard let self = self else { return }
            self.updateInterfaceWith(film: film)
        }
        
//        parsingFilms.onCompletion = { film in
//
//            self.updateInterfaceWith(film: film)
////            self?.filmResult = data
//
////            self?.updateInterfaceWith(film: film)
////            guard let self = self else { return }
////            self.updateInterfaceWith(film: Result)
//        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return film.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
                
        cell.titleLabel.text = film[indexPath.row].originalTitle
        cell.overviewLabel.text = film[indexPath.row].overview
        cell.dateLabel.text = film[indexPath.row].releaseDate
        cell.imageOfFilm.image = UIImage(named: film[indexPath.row].posterPath)
        cell.imageOfFilm.layer.cornerRadius = 5
        cell.imageOfFilm.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetail" {
//            guard let indexPath = tableView.indexPathForSelectedRow else { return }
//            let film =
//        }
//    }
    func updateInterfaceWith(film: Film) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//extension NSLayoutConstraint {
//
//    override public var description: String {
//        let idC = identifier ?? ""
//        return "id: \(idC), constant: \(constant)" //you may print whatever you want here
//    }
//}
