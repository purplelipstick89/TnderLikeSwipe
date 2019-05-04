//
//  ViewController.swift
//  TnderLikeSwipe
//
//  Created by Lary Tertuliano on 02/05/19.
//  Copyright © 2019 Lary Tertuliano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var secondCardView: CardView!
    
    var pessoas = [
        Pessoas(nomeLabel: "Ailton Junior", imageName: "Image1.jpg", turnoLabel: "Tarde"),
        Pessoas(nomeLabel: "Ailton Junior", imageName: "Image2.jpg", turnoLabel: "Tarde"),
        Pessoas(nomeLabel: "Ailton Junior", imageName: "Image3.jpg", turnoLabel: "Tarde"),
    ]
    
    var pessoaVisible = 0
    
    var originalPosition : CGPoint!
    
    func updateCards(){
        if pessoaVisible < pessoas.count {
            cardView.center = originalPosition
            cardView.transform = .identity
            cardView.hideReactions()
            cardView.updateCardView(pessoa: pessoas[pessoaVisible])
            
            if pessoaVisible < pessoas.count - 1 {
                secondCardView.updateCardView(pessoa: pessoas[pessoaVisible + 1])
            } else {
                secondCardView.isHidden = true
            }
        }
    }
    
    var divisionParam: CGFloat!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        divisionParam = (view.frame.size.width/2)/0.61
        
        originalPosition = cardView.center
        updateCards()

    }
    
    func moveLeft(){
        self.pessoaVisible += 1
        self.updateCards()
    }
    
    func moveRight(){
        self.pessoaVisible += 1
        self.updateCards()
    }
    
    @IBAction func panGestureValueChanged(_ sender: UIPanGestureRecognizer) {
        let cardView = sender.view! as! CardView
        let translationPoint = sender.translation(in: view)
        cardView.center = CGPoint(x: view.center.x+translationPoint.x, y: view.center.y+translationPoint.y)
        
        if sender.state == UIGestureRecognizer.State.ended {
            if cardView.center.x < 20 { // Moved to left
                UIView.animate(withDuration: 0.3, animations: {
                    cardView.center = CGPoint(x: cardView.center.x-200, y: cardView.center.y)
                }) { _ in
                    self.moveLeft()
                }
                return
            }
            else if (cardView.center.x > (view.frame.size.width-20)) { // Moved to right
                UIView.animate(withDuration: 0.3, animations: {
                    cardView.center = CGPoint(x: cardView.center.x+200, y: cardView.center.y)
                }) { _ in
                    self.moveRight()
                }
                return
            }
            
            UIView.animate(withDuration: 0.2, animations: {
                cardView.center = self.view.center
               cardView.hideReactions()
            })
        }
        
        let distanceMoved = cardView.center.x - view.center.x
        if distanceMoved > 0 { // moved right side
            cardView.presentALpha(alpha: abs(distanceMoved)/view.center.x)
           
            
        }
        else { // moved left side
            cardView.missedALpha(alpha: abs(distanceMoved)/view.center.x)
            
        }
        
        cardView.transform = CGAffineTransform(rotationAngle: distanceMoved/divisionParam)
    }
    
//    @IBAction func superLike(_ sender: Any) {
//        UIView.animate(withDuration: 0.3, animations: {
//        self.cardView.center = CGPoint (x: self.cardView.center.x, y: self.cardView.center.y-1000)
//        })
//    }
//    
    
}

