//
//  Memo.swift
//  DevelopingAppsForIosCS193P.1
//
//  Created by 신지훈 on 2021/07/26.
//

import Foundation
/*
 Computed Properties
 
 why compute the value of a property?
 Lots of times a "Property" is "derived" from other state.
 For example, in Concentration, we can derive this var easily from looking at the cards ...
 var indexOfOneAndOnlyFaceUpCard: Int?
 In fact, properly keeping this var up-to-date is just plain error - prone. This would ve sefer...
 var indexOfOneAndOnlyFaceUpCard: Int? {
 get {
 //look at all the cards and see if you find only one that's face up
 //if so, return it, else return nil
 set {
 //turn all the cards face down except the card at index newValue
     }
 }
 
 
 
