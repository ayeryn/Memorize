//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jia Li on 7/9/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    // Wht let??
    // A class is a reference type so "game" is only a reference
    // We will not be changing the reference
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
