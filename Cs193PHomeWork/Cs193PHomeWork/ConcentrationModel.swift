//
//  ConcentrationModel.swift
//  Cs193PHomeWork
//
//  Created by 신지훈 on 2021/07/23.
//

import Foundation
class Concentration {
    var cards = [Card]() // empty Card Array create
    
    var indexOfOneAndOnlyFaceUpCard: Int? //one card face up inside Index make Optional Int


    func chooseCard(at index: Int) { //choose card index
        if !cards[index].isMatched { //If not Matched card..Evaluate
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //matchIndex storage indexOfOneAndOnlyFaceUpCard, If matchIndex not equal index
                //Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    //If cardsArr matchIndex identifier == cards index identifier ..Evaluate
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            } else {
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
}
