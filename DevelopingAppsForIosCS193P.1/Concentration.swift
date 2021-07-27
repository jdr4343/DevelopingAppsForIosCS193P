//
//  Concentration.swift
//  DevelopingAppsForIosCS193P.1
//
//  Created by 신지훈 on 2021/07/23.
//

import Foundation
//Model
//Create Api
struct Concentration {
    var cards = [Card]()
    //이 인덱스는 실제로 프로그래머들에게 속성으로 인식됩니다 게임의 속성이고 앞면인 카드의 인덱스이죠 그것을 결정하는 다른 방법은 만약 set 혹은 get이 많은 작업을 수행해야 하고 다루기 까다롭다면 하나의 함수로 만들고 싶을 것입니다. 그렇게 함으로써 사람들이 가벼운 속성으로 인식하지 않고 요청하기 까다롭다 여기게 하는것이죠 여기 이방식은 많은 일을하는 것 같아보이지만 매우 간단합니다. 다음 수업에서 아마 수요일 쯤에 이것의 훨신 더 간단한 버전을 보여드릴겁니다.

    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            //get in the index
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {// No find card And is this first
                        foundIndex = index //foundIndex Set
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
   mutating func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                 // Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
            } else {
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
        
        //생략
        
        //Quste: Shuffle the cards
        //카드를 섞지 않으면 항상 같은 순서가 됩니다. 카드 게임하기 정말 쉬워 지는 거죠 이부분은 숙제로 남겨두겠습니다. 여러분이 카드를 섞어보세요 여러분이 값,타입,배열,또는 값 타입 등 이런걸 모두 이해해야 할수 있습니다. 굉장히 좋은 연습이죠
        //내가 구현해야 되는 기능 게임을 다 플레이 하면
    
}
/*
 if CardgameEnd {
  SuffledCard = .randomIndex
 }
 */

