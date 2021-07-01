//
//  CardSelection.swift
//  CardWorkout
//
//  Created by Harry Crocks on 31.05.2021.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    var cards: [UIImage] = Card.allValues
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }

    
    @objc func showRandomImage() {
        print("timer fired off")
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    @IBAction func stopTapped(_ sender: UIButton) {
        timer.invalidate()
        
    }
    
    @IBAction func restartTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
}
