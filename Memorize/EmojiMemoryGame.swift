//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jia Li on 7/12/23.
//
// This is the ViewModel

import SwiftUI

// Publishes changes
class EmojiMemoryGame: ObservableObject {
    
    // type var - global for the type
    static let emojis = ["✈️", "🚗", "🚄", "🚀", "🚛", "🚁", "🚌", "🛴", "🛵", "🛸", "🚲", "🚎", "🚕", "🏎️", "🚜", "🏍️","🚙"]
    
    // type func
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // private - gatekeeping
    // @Published - publishes a change anytime this var changes
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        // Another way to do @Published
        // objectWillChange.send()
        model.choose(card)
    }
}
