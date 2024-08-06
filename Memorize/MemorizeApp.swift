//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Maha Gamaleldeen on 30/07/2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
    
    
}
