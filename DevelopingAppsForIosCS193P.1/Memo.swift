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
 
 
 
 
 Access Control
 
 Protexting our internal implementations
 Likely most of you have only worked on relatively small projects
 Inside those projects, any object can pretty much call any function in any other object
 When projects start to get large, though, this vecomes very dicey
 you want to be able to protect the INTERNAL inplementation of data structures
 you do this by marking which API* you want other code to yse with certain keywords
 
 
 *I.e. methods and properties
 
 protecting our internal implmentations
 Swift supports this with the following access control keywords ...
 1) internal - this is the default, it means "usable by any object in my app or framework"
 2) private - this means "only callable from within this object"
 3) private(Set) - this means "this property is readable outside this object but not settable"
 4) fileprivate - accessible by any code in this source file
 5) public - (for frameworks only) this can be uesd by objects outside my frame work
 6) open - (for frameworks only) public and objects outside my framework can subclass this
 
 
 
 
 
 
 Extensions
 
 *Extnding existing data structures
 you can add methods/properties to a class/struct/enum(even if you don't have the source).
 
 *There are some restrictions
 you can't re-implement methods or properties that already there(only add new ones)
 the properties you add can have no storeage associated with them (computed only)
 
 *This feature is easily abused
 It should be used to add clarity to readability not obfuscation!
 Don't use it as a substitute for good object-oriented design technique
 Best uesd (at least for beginners) for very small, well-contained helper functions
 Can actually be used well to organize code but requires architectural commitment
 When in doubt (for now). don't do it
 */
