//
//  SecondViewController.swift
//  Top Film
//
//  Created by Maks on 08.06.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    var currentFilms: Result?
    
    @IBOutlet var imageFilm: UIImageView!
    @IBOutlet var titleFilm: UILabel!
    @IBOutlet var overviewFilm: UILabel!
    @IBOutlet var datePresentFilm: UILabel!
    @IBOutlet var rateFilm: UILabel!
    @IBOutlet var playFilmAction: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        playFilmAction.contentHorizontalAlignment = .fill
//        playFilmAction.contentVerticalAlignment = .fill
        
        self.title = "TOP Film"
//      Видаляємо назву кнопки повернення на головний екран
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        setupSVC()
    }
    
    private func setupSVC() {
        titleFilm.text = currentFilms?.originalTitle
        overviewFilm.text = currentFilms?.overview
        rateFilm.text = currentFilms?.voteAverageString
        datePresentFilm.text = "Release: " + currentFilms!.releaseDate
        let imageOfFilmURL = "https://image.tmdb.org/t/p/"+"w500"+currentFilms!.posterPath
        guard let url = URL(string: imageOfFilmURL) else { return }
        imageFilm.sd_setImage(with: url, completed: nil)
        imageFilm.addBlackGradientLayerInBackground(frame: imageFilm.frame, colors: [.clear, .black])
    }
    
    @IBAction func playFilmAction(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil,
                                                message: currentFilms?.originalTitle,
                                                preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(ok)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
}
// Градієнт постера
extension UIView{
    // For insert layer in Foreground
    func addBlackGradientLayerInForeground(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        self.layer.addSublayer(gradient)
    }
    // For insert layer in background
    func addBlackGradientLayerInBackground(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        self.layer.insertSublayer(gradient, at: 0)
    }
}




