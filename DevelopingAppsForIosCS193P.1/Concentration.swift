//
//  Concentration.swift
//  DevelopingAppsForIosCS193P.1
//
//  Created by 신지훈 on 2021/07/23.
//

import Foundation
//Model
//Create Api
class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
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
        

        //Quste: Shuffle the cards
        //카드를 섞지 않으면 항상 같은 순서가 됩니다. 카드 게임하기 정말 쉬워 지는 거죠 이부분은 숙제로 남겨두겠습니다. 여러분이 카드를 섞어보세요 여러분이 값,타입,배열,또는 값 타입 등 이런걸 모두 이해해야 할수 있습니다. 굉장히 좋은 연습이죠
        
    }
}
/*
 if CardgameEnd {
  SuffledCard = .randomIndex
 }
카드를 다 맞추고 나면 셔플
 */

