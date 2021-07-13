//
//  ViewController.swift
//  ShimmerLabelText
//
//  Created by Harry Crocks on 13.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = UIColor(white: 1, alpha: 0.1)
        
        //darker label in the back
        let darkTextLabel = UILabel()
        darkTextLabel.text = "Shimmer"
        darkTextLabel.textColor = UIColor(white: 1, alpha: 0.1)
        darkTextLabel.font = UIFont.boldSystemFont(ofSize: 80)
        darkTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 400)
        darkTextLabel.textAlignment = .center
        
        view.addSubview(darkTextLabel)

        //shiny label in the back
        let shinyTextLabel = UILabel()
        shinyTextLabel.text = "Shimmer"
        shinyTextLabel.textColor = .white
        shinyTextLabel.font = UIFont.boldSystemFont(ofSize: 80)
        shinyTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 400)
        shinyTextLabel.textAlignment = .center
        
        view.addSubview(shinyTextLabel)
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = shinyTextLabel.bounds
        
        let angle = 45 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        shinyTextLabel.layer.mask = gradientLayer
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.fromValue = -view.frame.size.width
        animation.toValue = view.frame.size.width
        animation.duration = 3
        animation.repeatCount = Float.infinity
        
        
        gradientLayer.add(animation, forKey: "doesn't matter")
//        view.layer.addSublayer(gradientLayer)
        
    }


}

