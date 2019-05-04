//
//  CardView.swift
//  TnderLikeSwipe
//
//  Created by Lary Tertuliano on 03/05/19.
//  Copyright © 2019 Lary Tertuliano. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var pessoaImage: UIImageView!
    @IBOutlet weak var missedImage: UILabel!
    @IBOutlet weak var presentImage: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var turnoLabel: UILabel!
    @IBOutlet weak var faltasLabel: UILabel!
    
   
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func layoutSubviews() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        
    }
    
    func hideReactions() {
        presentImage.alpha = 0
        missedImage.alpha = 0
    }
    
    func presentALpha(alpha: CGFloat){
        presentImage.alpha = alpha
        missedImage.alpha = 0
    }

    func missedALpha(alpha: CGFloat){
        missedImage.alpha = alpha
        presentImage.alpha = 0
    }
    
    func updateCardView (pessoa: Pessoas) {
        pessoaImage.image = UIImage(named: pessoa.imageName)
        nomeLabel.text = pessoa.nomeLabel
        turnoLabel.text = pessoa.turnoLabel
    }
    
    func changeImage(imageName: String){
        pessoaImage.image = UIImage(named: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }
    
    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CardView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}


