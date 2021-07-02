//
//  ViewController.swift
//  AnimationRing
//
//  Created by Harry Crocks on 02.07.2021.
//

import UIKit

class ViewController: UIViewController {

    let shape = CAShapeLayer()
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Goal"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 36, weight: .medium)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center
        
        
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 150, startAngle: -(.pi / 2), endAngle: .pi * 2, clockwise: true)
        
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 15
        trackShape.strokeColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(trackShape)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.blue.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
    
        let button = UIButton(frame: CGRect(x: 30, y: view.frame.size.height-100, width: view.frame.width-60, height: 50))
        button.setTitle("Animate", for: .normal)
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc func didTapButton() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
    }

    

}

