//
//  SecondViewController.swift
//  Top Film
//
//  Created by Maks on 08.06.2022.
//

import UIKit

protocol DetailsViewControllerProtocol {
    
}

class DetailsViewController: UIViewController {
    
    @IBOutlet private weak var filmImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var rateLabel: UILabel!
    
    private var presenter: DetailsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupViews()
    }
    
    func setupPresenter(film: Film) {
        self.presenter = DetailsPresenter(view: self, film: film)
    }
    
    private func setupNavBar() {
        self.title = "TOP Film"
        
        //      We remove the name of the button to return to the main screen
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setupViews() {
        let film = presenter.film
        
        self.titleLabel.text = film.originalTitle
        self.overviewLabel.text = film.overview
        self.rateLabel.text = film.voteAverageString
        self.dateLabel.text = film.releaseDate
        
        let inputImageData = film.posterPath
        ImageDownloaderManager.loadImageFromDatabase(inputImageData: inputImageData,
                                                     outputImage: filmImageView)
        
        GradientPoster.addBlackGradientLayerInBackground(image: filmImageView, frame: filmImageView.bounds, colors: [.clear, .black])
    }
    
    @IBAction private func playFilmAction(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil,
                                                message: presenter.film.originalTitle,
                                                preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(ok)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
}

extension DetailsViewController: DetailsViewControllerProtocol {
    
}







