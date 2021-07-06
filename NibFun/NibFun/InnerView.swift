//
//  InnerView.swift
//  NibFun
//
//  Created by Harry Crocks on 06.07.2021.
//
import UIKit

@IBDesignable
class InnerView: UIView {

    @IBInspectable var myColor: UIColor = .systemOrange
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = myColor
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}
