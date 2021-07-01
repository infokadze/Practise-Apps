//
//  UIColor+Ext.swift
//  Timer2
//
//  Created by Harry Crocks on 01.07.2021.
//

import UIKit

extension UIColor {

static func random() -> UIColor {
    let redValue: CGFloat = .random(in: 0...1)
    let greenValue: CGFloat = .random(in: 0...1)
    let blueValue: CGFloat = .random(in: 0...1)
    
    return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
}
