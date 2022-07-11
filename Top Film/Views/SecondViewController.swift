//
//  SecondViewController.swift
//  Top Film
//
//  Created by Maks on 08.06.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    let constants = Constants()

    var currentFilms: Result?
    
    @IBOutlet private weak var imageFilm: UIImageView!
    @IBOutlet private weak var titleFilm: UILabel!
    @IBOutlet private weak var overviewFilm: UILabel!
    @IBOutlet private weak var datePresentFilm: UILabel!
    @IBOutlet private weak var rateFilm: UILabel!
    @IBOutlet private weak var playFilmAction: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TOP Film"
//      We remove the name of the button to return to the main screen
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        setupSVC()
    }
    
    private func setupSVC() {
        titleFilm.text = currentFilms?.originalTitle
        overviewFilm.text = currentFilms?.overview
        rateFilm.text = currentFilms?.voteAverageString
        datePresentFilm.text = "Release: " + currentFilms!.releaseDate
        ImageDownloaderManager.loadImageFromDatabase(inputImageData: currentFilms!.posterPath, outputImage: imageFilm)
        GradientPoster.addBlackGradientLayerInBackground(image: imageFilm, frame: imageFilm.bounds, colors: [.clear, .black])
    }
    
    @IBAction private func playFilmAction(_ sender: UIButton) {
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





