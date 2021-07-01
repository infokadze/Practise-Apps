//
//  RulesVC.swift
//  ProgrammaticCardProject
//
//  Created by Harry Crocks on 01.06.2021.
//

import UIKit

class RulesVC: UIViewController {

    let titleLabel          = UILabel()
    let rulesLabel          = UILabel()
    let exerciseLabel       = UILabel()
    
    
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        configureTitleLabel()
        configureRulesLabel()
        configureExerciseLabel()
        
    }
    
    //MARK:- TitleLabelSetup
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])

    }
    //MARK:- RulesLabelSetup
    func configureRulesLabel() {
        view.addSubview(rulesLabel)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.text = """
The value of each card represents the number of exercise you do.


J = 11, Q = 12, K = 13, A = 14
"""
        rulesLabel.textAlignment = .center
        rulesLabel.font = .boldSystemFont(ofSize: 19)
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0
        
        
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    //MARK:- ExerciseLabelSetup
    func configureExerciseLabel() {
        view.addSubview(exerciseLabel)
        exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseLabel.text = """
♣️ = burpees  ♥️ = sit-up   ♦️ = jumping jacks  ♠️ = push-ups
"""
        exerciseLabel.font = .boldSystemFont(ofSize: 19)
        exerciseLabel.numberOfLines = 0
        
        
        NSLayoutConstraint.activate([
            exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 60),
            exerciseLabel.widthAnchor.constraint(equalToConstant: 200),
            exerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

