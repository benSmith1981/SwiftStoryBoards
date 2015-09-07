//
//  Player.swift
//  SwiftStoryboard
//
//  Created by Ben Smith on 06/09/2015.
//  Copyright (c) 2015 Ben Smith. All rights reserved.
//

import Foundation

class Player{
    var name: String?
    var game: String?
    var rating: Int?

    init(name: String, game:String , rating: Int){
        self.name = name
        self.game = game
        self.rating = rating
    }
}
