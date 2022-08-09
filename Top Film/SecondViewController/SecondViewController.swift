//
//  SecondViewController.swift
//  Top Film
//
//  Created by Maks on 08.06.2022.
//

import UIKit

protocol SecondViewControllerProtocol: AnyObject {
    func setupSVCData(titleFilm: String?,
                      overviewFilm: String?,
                      rateFilm: String?,
                      datePresentFilm: String?,
                      imageFilm1: UIImageView)
    
    func imageOutlet() -> (UIImageView?)
}

class SecondViewController: UIViewController {
    
    private var secondPresenter: SecondViewPresenterProtocol!
    
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
        
        secondPresenter = SecondViewPresenter(view: self, currentFilms1: currentFilms)
        secondPresenter?.setupSVCDataPresenter()
    }
    
    @IBAction private func playFilmAction(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil,
                                                message: secondPresenter.configure()?.originalTitle,
                                                preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(ok)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
}

extension SecondViewController: SecondViewControllerProtocol {
    
    func imageOutlet() -> (UIImageView?) {
        guard let imageOutlet = imageFilm else { return nil }
        return imageOutlet
    }
    
    func setupSVCData(titleFilm: String?, overviewFilm: String?, rateFilm: String?, datePresentFilm: String?, imageFilm1: UIImageView) {
        
        self.titleFilm.text = titleFilm
        self.overviewFilm.text = overviewFilm
        self.rateFilm.text = rateFilm
        self.datePresentFilm.text = datePresentFilm
        self.imageFilm = imageFilm1
        
        GradientPoster.addBlackGradientLayerInBackground(image: imageFilm, frame: imageFilm.bounds, colors: [.clear, .black])
    }
}







