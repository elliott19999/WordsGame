//
//  Player.swift
//  WordsGame
//
//  Created by Мадина Валиева on 24.06.2024.
//

import Foundation
struct Player {
    let name:String
    var score = 0
    
    mutating func add(score:Int) {
        self.score = score
    }
}
