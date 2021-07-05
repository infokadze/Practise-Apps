//
//  HardcodedGradient.swift
//  GradientColor2
//
//  Created by Harry Crocks on 05.07.2021.
//

import UIKit

class HardcodedGradient: UIView {

    let topColor: UIColor = UIColor.lightGray
    let bottomColor: UIColor = UIColor.darkGray
    
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    private func commonInit() {
        gradientLayer.colors = [
            topColor.cgColor, bottomColor.cgColor
        ]
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if gradientLayer.frame != bounds {
            gradientLayer.frame = bounds
        }
        
        let newColors = [
            UIColor.systemRed.cgColor,
            UIColor.systemGreen.cgColor,
            UIColor.systemYellow.cgColor,
            UIColor.systemPink.cgColor
        ]
        
        gradientLayer.setColors(newColors, animated: true, withDuration: 3, timingFunctionName: .linear)
    }
}

extension CAGradientLayer {
    
    func setColors(_ newColors: [CGColor],
                   animated: Bool = true,
                   withDuration duration: TimeInterval = 0,
                   timingFunctionName name: CAMediaTimingFunctionName? = nil) {
    
    if !animated {
    self.colors = newColors
    return
    }
    
    let colorAnimation = CABasicAnimation(keyPath: "colors")
        colorAnimation.fromValue = colors
        colorAnimation.toValue = newColors
        colorAnimation.duration = duration
        colorAnimation.isRemovedOnCompletion = false
        colorAnimation.fillMode = CAMediaTimingFillMode.forwards
        colorAnimation.timingFunction = CAMediaTimingFunction(name: name ?? .linear)
        
        add(colorAnimation, forKey: "colorsChangeAnimation")
}
}
