//
//  ViewController.swift
//  Concetration
//
//  Created by Ankur Saini on 18/09/20.
//  Copyright © 2020 Ankur Saini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0 {
        didSet{
            FlipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiChoices: Array<String> = ["🎃","🎃","👻","👻"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        else{
            print("chosen card was not in card buttons")
        }
    }
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBOutlet weak var FlipCountLabel: UILabel!
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

