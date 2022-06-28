//
//  SecondViewController.swift
//  Top Film
//
//  Created by Maks on 08.06.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    var currentFilms: Film?
    
    @IBOutlet var imageFilm: UIImageView!
    @IBOutlet var titleFilm: UILabel!
    @IBOutlet var overviewFilm: UILabel!
    @IBOutlet var datePresentFilm: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TOP Film"
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        imageFilm.image = UIImage(named: "Ремінісценція")
        titleFilm.text = "Ремінісценція"
        overviewFilm.text = "Головною героїнею фільму «Перехоплювач» виявляється Джей Коллінз – капітан армії, яка все своє життя йшла до однієї єдиної мети, але втратила потрібний момент. Жінка через дурний випадок позбуваяється заповітної посади в Пентагоні. Здаватися Коллінз не збирається. Наразі найкращим рішенням стає повернення додому. Плани зненацька зриваються. На базу вчинено напад. Якщо не спробувати дати ворогам відсіч, то ядерна зброя опиниться в руках тих, хто здатний без зайвих роздумів знищити цілу планету."
        datePresentFilm.text = "12.06.2022"
        
    }
}





