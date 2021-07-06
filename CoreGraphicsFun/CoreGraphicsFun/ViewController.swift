//
//  ViewController.swift
//  Gradients3
//
//  Created by Harry Crocks on 05.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView = UIImageView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        drawRotatedSquare()
    }
    
    
    func drawRotatedSquare() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 256, height: 256))
        
        let img = renderer.image { ctx in
            
            ctx.cgContext.translateBy(x: 128, y: 128)
            let rotations = 16
            let amount = Double.pi / Double(rotations)
            
            // add 16 rotated rectangles
            for _ in 0 ..< rotations {
                ctx.cgContext.rotate(by: CGFloat(amount))
                ctx.cgContext.addRect(CGRect(x: -64, y: -64, width: 128, height: 128))
            }
            
            ctx.cgContext.setStrokeColor(UIColor.systemRed.cgColor)
            ctx.cgContext.strokePath()
        }
        
        imageView.image = img
    }
    
    

}

