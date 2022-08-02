//
//  GradientPoster.swift
//  Top Film
//
//  Created by Maks on 10.07.2022.
//

import Foundation
import UIKit

class GradientPoster {
    
    // For insert layer in Foreground
    static func addBlackGradientLayerInForeground(image: UIImageView, frame: CGRect, colors:[UIColor]) -> Void {
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        image.layer.addSublayer(gradient)
        return
    }
    // For insert layer in background
    static func addBlackGradientLayerInBackground(image: UIImageView, frame: CGRect, colors:[UIColor]) -> Void {
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        image.layer.insertSublayer(gradient, at: 0)
        return
    }
}
