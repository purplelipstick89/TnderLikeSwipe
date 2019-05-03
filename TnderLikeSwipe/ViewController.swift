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
    @IBOutlet weak var missed: UILabel!
    @IBOutlet weak var present: UILabel!
    var divisionParam: CGFloat!
    @IBOutlet weak var imageUIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Responsável por arrendodar as bordas da UIView
        cardView.clipsToBounds = true
        cardView.layer.cornerRadius = 5
        
        divisionParam = (view.frame.size.width/2)/0.61
        
        imageUIImageView.image = UIImage(named: "Image\(arc4random_uniform(50) + 1).jpg")
    }
    
    
    @IBAction func panGestureValueChanged(_ sender: UIPanGestureRecognizer) {
        let cardView = sender.view!
        let translationPoint = sender.translation(in: view)
        cardView.center = CGPoint(x: view.center.x+translationPoint.x, y: view.center.y+translationPoint.y)
        
        if sender.state == UIGestureRecognizer.State.ended {
            if cardView.center.x < 20 { // Moved to left
                UIView.animate(withDuration: 0.3, animations: {
                    cardView.center = CGPoint(x: cardView.center.x-200, y: cardView.center.y)
                })
                return
            }
            else if (cardView.center.x > (view.frame.size.width-20)) { // Moved to right
                UIView.animate(withDuration: 0.3, animations: {
                    cardView.center = CGPoint(x: cardView.center.x+200, y: cardView.center.y)
                })
                return
            }
            
            UIView.animate(withDuration: 0.2, animations: {
                cardView.center = self.view.center
                self.missed.alpha = 0
                self.present.alpha = 0
            })
        }
        let distanceMoved = cardView.center.x - view.center.x
        if distanceMoved > 0 { // moved right side
            present.alpha = abs(distanceMoved)/view.center.x
            missed.alpha = 0
        }
        else { // moved left side
            missed.alpha = abs(distanceMoved)/view.center.x
            present.alpha = 0
        }
        
        cardView.transform = CGAffineTransform(rotationAngle: 0.61)
    }
    @IBAction func superLike(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
        self.cardView.center = CGPoint (x: self.cardView.center.x, y: self.cardView.center.y-1000)
        })
    }
}

