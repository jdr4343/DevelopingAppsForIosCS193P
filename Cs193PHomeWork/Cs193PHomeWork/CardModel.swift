//
//  CardModel.swift
//  Cs193PHomeWork
//
//  Created by 신지훈 on 2021/07/23.
//

import Foundation

struct Card {
    //카드가 뒤집혔을때 쌍을 이루었을때 불값 전달
    var isFaceUp = false
    var isMatched = false
    var identifier: Int


static var identifierFactory = 0


static func UniqueIdentifier() -> Int {
    identifierFactory += 1
    return identifierFactory
}

init() {
    self.identifier = Card.UniqueIdentifier()
 }
}
