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

   lazy var game = Concentration(numberOfPairsOfCards: (cardBtn.count + 1) / 2)//과제에선 이렇게 하면됩니다.
    
    
    
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
    
 
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardBtn.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            //여기서 처리하지 않고 모델에 처리하도록 하겠습니다. 여기서는 선택되었다고만 알려주는거죠.하지만 여기에서 주의할 점이 있습니다. 모델에게 이 카드를 선택하라고 할 때 바뀔 수 있습니다. game이 바뀔 수 있죠.그럼 이제 모델로 부터 뷰를 업데이트 해야 합니다.뷰는 지금 모델과 동기화가 안되어 있습니다. 왜냐하면 우리가 카드를 선택했을때 그 선택이 game을 바뀌게 하죠.
            updateViewFromModel()
        } else {
            print("chosen card was not cardButtons")
        }
       
    }
    func updateViewFromModel() {
        for index in cardBtn.indices {
            let button = cardBtn[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 0) : #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            }
        }
    }
    var emojiChoices = ["👻","👹","👿","👽","☠️","🤡"]
    
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
        
    }


}

