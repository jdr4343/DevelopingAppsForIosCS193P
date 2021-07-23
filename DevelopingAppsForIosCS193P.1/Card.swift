//
//  Card.swift
//  DevelopingAppsForIosCS193P.1
//
//  Created by 신지훈 on 2021/07/23.
//
//Card Model
import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    //The card here is independent of Ui.So emoticons or jpeg images shouldn't be here.
    //They're about how to show the cards, which is about what the cards should do, how the game is played.So you can't put emoticons in the model here.This is a model, not a UI.
    
    
    static var identifierFactory = 0
    
    
    
   //static functional
    //The static function is a function and is within the card class, but cannot be sent to the card. The card does not understand this message. Card type is the only thing that understands this message. This can be sent to the type itself. Think of it as a global function, utility function, or just a function attached to the type.
    //Can you understand? I can't ask the card to give me the only identifier. I'll ask the card type itself. Silence means this.
   // So if you want to call this function, send it to the type.
    static func gerUniqueIdentifier() -> Int {
       // Each time called, this method will return the only identifier.
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.gerUniqueIdentifier()
    }
}
