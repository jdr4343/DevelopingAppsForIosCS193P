//
//  ViewController.swift
//  DevelopingAppsForIosCS193P.1
//
//  Created by 신지훈 on 2021/07/19.
//

import UIKit
//class nameController: superClass {
class ViewController: UIViewController {
//Put all method and instance variables within {}.

    //apped flipCount you press the card, it makes flipCount += 1.
    var flipCount = 0 {
        didSet {
            //Observer 속성감시자
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
//If you press the button, the method will work.
    //When making array, it is better to specify the type so that Swift is not tired.
    @IBOutlet var cardBtn: [UIButton]!
    
    var emojiChoices = ["👻","👹","👿","👽","☠️","🤡","👽","👹","☠️","🤡","👻","👿"]
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardBtn.index(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("chosen card was not caedButtons")
        }
       
    }
    
   
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

