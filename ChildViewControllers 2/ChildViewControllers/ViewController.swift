//
//  ViewController.swift
//  ChildViewControllers
//
//  Created by Harry Crocks on 12.07.2021.
//

import UIKit

class ViewController: UIViewController {

    private lazy var firstChildVC = FirstChildViewController()
    private lazy var secondChildVC = SecondChildViewController()
    
   
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVCs()

        view.addSubview(firstChildVC.view)
        view.addSubview(secondChildVC.view)
        
        firstChildVC.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 3)
        secondChildVC.view.frame = CGRect(x: 0, y: view.frame.size.height / 3, width: view.frame.size.width, height: (view.frame.size.height / 3) * 2)
    }
    private func addChildVCs() {
        addChild(firstChildVC)
        addChild(secondChildVC)
        
        firstChildVC.didMove(toParent: self)
        secondChildVC.didMove(toParent: self)
    
        
    }
    
    
    

}

