//
//  ViewController.swift
//  TnderLikeSwipe
//
//  Created by Lary Tertuliano on 02/05/19.
//  Copyright © 2019 Lary Tertuliano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 @IBOutlet weak var cardView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func panGestureValueChanged(_ sender: UIPanGestureRecognizer) {
        let cardView = sender.view!
        let translationPoint = sender.translation(in: view)
        cardView.center = CGPoint(x: view.center.x+translationPoint.x, y: view.center.y+translationPoint.y)
        
    }
    
}

