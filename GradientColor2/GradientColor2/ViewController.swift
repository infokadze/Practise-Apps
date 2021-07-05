//
//  ViewController.swift
//  GradientColor2
//
//  Created by Harry Crocks on 05.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        view = HardcodedGradient()
    }
    
}
    
    
//    
//    override func viewDidAppear(_ animated: Bool) {
//        
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = view.bounds
//        gradientLayer.type = .axial
//        gradientLayer.colors = [
//            UIColor.systemBlue.cgColor, UIColor.systemPink.cgColor, UIColor.systemGreen.cgColor, UIColor.systemOrange.cgColor
//        ]
////
////        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
////        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//        gradientLayer.locations = [0.2, 0.4, 0.7, 0.8]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//        view.layer.addSublayer(gradientLayer)
//    }
//}




