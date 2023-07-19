//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jia Li on 7/17/23.
//
// This is our Model

import Foundation

struct CardGame<CardContent> {
    var cards: [Card<CardContent>]
    
//    init(fromContent content: [CardContent]){
//        for c in content {
//            var card = Card<CardContent>(content: c)
//        }
//
//    }
}

struct Card<CardContent> {
    var isFaceUp = false
    var isMatched = false
    var content: CardContent
}
