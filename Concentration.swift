//
//  Concentration.swift
//  Concetration
//
//  Created by Ankur Saini on 20/09/20.
//  Copyright © 2020 Ankur Saini. All rights reserved.
//

import Foundation

class concetration
{
    var cards = [Card]()
    
    func chooseCard(at index: Int){
        if cards[index].isFaceUp{
            cards[index].isFaceUp = false
        }
        else{
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
    }
    
    //TODO: shuffle the cards
}
