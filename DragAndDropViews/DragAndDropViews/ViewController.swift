//
//  ViewController.swift
//  DragAndDropViews
//
//  Created by Harry Crocks on 08.07.2021.
//

import UIKit

class ViewController: UIViewController {

    private let myView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.backgroundColor = .systemOrange
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private var isDragging = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myView.center = view.center
    }

    var oldX: CGFloat = 0
    var oldY: CGFloat = 0
    
}
//MARK: - Touches
extension ViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: myView)
        
        oldX = location.x
        oldY = location.y
        
        if myView.bounds.contains(location) {
            isDragging = true
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDragging, let touch = touches.first else { return }
        let location = touch.location(in: view)
        myView.frame.origin.x = location.x - oldX
        myView.frame.origin.y = location.y - oldY
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

