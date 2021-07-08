//
//  OtherViewController.swift
//  NotificationCntroller1
//
//  Created by Harry Crocks on 08.07.2021.
//

import UIKit

class OtherViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("text"), object: textField.text)
        dismiss(animated: true)
    }
    

}
