//
//  ViewController.swift
//  Concetration
//
//  Created by Ankur Saini on 18/09/20.
//  Copyright © 2020 Ankur Saini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game: concentration = concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    
    var flipCount = 0 {
        didSet{
            FlipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
            
        else{
            print("chosen card was not in card buttons")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBOutlet weak var FlipCountLabel: UILabel!
    
    var emoji = [Int:String]()
    
    var emojiChoices: Array<String> = ["🎃","🦇","👻","👹","😈"]
    
    
    func emoji(for card : Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}
