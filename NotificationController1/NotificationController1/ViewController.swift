//
//  ViewController.swift
//  NotificationCntroller1
//
//  Created by Harry Crocks on 08.07.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification), name: Notification.Name("text"), object: nil)
    }
    
    @objc func didGetNotification(_ notification: Notification) {
        let text = notification.object as! String
        label.text = text
    }
    
    @IBAction func didTapButton() {
        let vc = storyboard?.instantiateViewController(identifier: "other") as! OtherViewController
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }


}

