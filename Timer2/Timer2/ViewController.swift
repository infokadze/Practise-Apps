//
//  ViewController.swift
//  Timer2
//
//  Created by Harry Crocks on 01.07.2021.
//

import UIKit

class ViewController: UIViewController {

    let countLabel = UILabel()
    var timer: Timer!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        view.backgroundColor = .random()
        countLabel.text = "Here we go"
        countLabel.numberOfLines = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(incrementCountLabel), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer.invalidate()
    }
    
//    @objc func changeBackground() {
//        view.backgroundColor = .random()
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            self.timer.invalidate()
//        }
//    }
    
    @objc func incrementCountLabel() {
        
        count += 1
        countLabel.text = String(count)
        view.backgroundColor = .random()
        
        if count == 11 {
            timer.invalidate()
            countLabel.text = "Finished"
        }
    }
    
    func configureLabel() {
        
        view.addSubview(countLabel)
        
        countLabel.font = .systemFont(ofSize: 100, weight: .bold)
        countLabel.textAlignment = .center
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 300),
            countLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

