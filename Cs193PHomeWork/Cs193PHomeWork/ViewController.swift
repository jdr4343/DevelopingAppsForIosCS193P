//
//  ViewController.swift
//  Cs193PHomeWork
//
//  Created by 신지훈 on 2021/07/23.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardBtn.count + 1) / 2)
//플립버튼을 누르면 카운트
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flip:\(flipCount)"
        }
    }
    
   @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardBtn: [UIButton]!
    

    @IBAction func clickBtn(_ sender: UIButton) {
        //카드를 누르면 플립 카드 증가
        flipCount += 1
        if let cardNumber = cardBtn.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not cardBtn")
        }
    }
    
    
    
    @IBAction func restartBtn(_ sender: UIButton) {
    flipCount = 0
        reset()
    }
    func reset() {
        for card in cardBtn.indices {
            game.cards[card].isFaceUp = false
            game.cards[card].isMatched = false
        }
        game.cards.shuffle()
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        for index in cardBtn.indices {
            let button = cardBtn[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 0) : #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)            }
        }
    }
    var emojiChoices = ["🐭","🐯","🙉","🐸","🐦","🐔","🦖","🦀","🐡","🐧","🐥","🐰","🐹","🐱","🐶","🐼","🐻‍❄️","🐨","🐮","🦉","🦊","🐻","🦁","🐷"]
    
    var emoji: [Int:String] = [:]
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            if emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        return emoji[card.identifier]! ?? "?"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

