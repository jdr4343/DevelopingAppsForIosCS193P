//
//  ViewController.swift
//  Cs193PHomeWork
//
//  Created by 신지훈 on 2021/07/23.
//

import UIKit

class ViewController: UIViewController {
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
    }
    
    
    
    @IBAction func restartBtn(_ sender: UIButton) {
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

