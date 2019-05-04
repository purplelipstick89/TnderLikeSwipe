//
//  Pessoas.swift
//  TnderLikeSwipe
//
//  Created by Lary Tertuliano on 04/05/19.
//  Copyright © 2019 Lary Tertuliano. All rights reserved.
//

import Foundation

class Pessoas {
    internal init(nomeLabel: String, imageName: String, turnoLabel: String) {
        self.nomeLabel = nomeLabel
        self.imageName = imageName
        self.turnoLabel = turnoLabel
    }
    
    var nomeLabel : String
    var imageName : String
    var turnoLabel : String
}

