//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jia Li on 7/12/23.
//
// This is the ViewModel

import SwiftUI


class EmojiMemoryGame {
    
    // type var - global for the type
    static let emojis = ["✈️", "🚗", "🚄", "🚀", "🚛", "🚁", "🚌", "🛴", "🛵", "🛸", "🚲", "🚎", "🚕", "🏎️", "🚜", "🏍️","🚙"]
    
    // type func
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }

    // Gatekeeping
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
}
