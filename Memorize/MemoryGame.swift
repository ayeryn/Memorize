//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jia Li on 7/12/23.
//
// This is the Model

import Foundation

struct MemoryGame<CardContent> {
    // (set) - read-only
    private(set) var cards: Array<Card>
    
    // label same as element, not necessary
    // mutating - will change self
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}){
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }

    // Passing a func to a func!!!
    // Functional language hehe
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        
        // add numberOfPairsOfCards x2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    // Struct inside a struct!!
    // Really it's MemoryGame.Card to the outside
    struct Card: Identifiable {
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent // don't care
        
        // Protocols are double-edged swords
        var id: Int
    }
}
