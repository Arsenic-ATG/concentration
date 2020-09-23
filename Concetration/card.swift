//
//  card.swift
//  Concetration
//
//  Created by Ankur Saini on 20/09/20.
//  Copyright © 2020 Ankur Saini. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory;
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
