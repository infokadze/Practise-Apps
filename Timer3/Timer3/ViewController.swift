//
//  ViewController.swift
//  Timer3
//
//  Created by Harry Crocks on 01.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemPink,
        .black,
        .systemGray,
        .systemGreen]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createTimer()
    }
    
    func createTimer() {
        var isAnimated = false
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.addSubview(myView)
        myView.center = view.center
        myView.backgroundColor = .link
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let strongSelf = self else { return }
            
            DispatchQueue.main.async {
                if isAnimated {
                    UIView.animate(withDuration: 1) {
                        myView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
                        myView.center = strongSelf.view.center
                    }
                    isAnimated = false
                    
                } else {
                    UIView.animate(withDuration: 1) {
                        myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                        myView.center = strongSelf.view.center
                    }
                    isAnimated = true
                }
            }
        }
        timer.fire()
    }
}


//
//    func createTimer() {
//        var ran = 1
//        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
//            if ran >= 10 {
//                timer.invalidate()
//            }
//            DispatchQueue.main.async {
//                self?.view.backgroundColor = self?.colors.randomElement() ?? .clear
//
//            }
//        }
////        timer.tolerance = 100
//    }
        
