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
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        
        return scrollView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        addChildVCs()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.size.width * 2, height: 0)
        scrollView.addSubview(firstChildVC.view)
        scrollView.addSubview(secondChildVC.view)
        
        
    }
    private func addChildVCs() {
        addChild(firstChildVC)
        addChild(secondChildVC)
        
        firstChildVC.didMove(toParent: self)
        secondChildVC.didMove(toParent: self)
        
        firstChildVC.view.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        
        secondChildVC.view.frame = CGRect(x: scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width , height: scrollView.frame.size.height)
        
    }
    
    @IBAction func didChangeVC(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            scrollView.setContentOffset(CGPoint(x: view.frame.size.width, y: 0), animated: true)
        }
    
    }
    

}

