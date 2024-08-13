//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Maha Gamaleldeen on 30/07/2024.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "❄️", "🧙", "😱", "👹", "🙀", "☠️", "🍭"]
        
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 11) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]

            } else {
                return "!?"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
   
    
    //MARK: - Intents
    
    // intent function i.e about user's intent
    func chooseCard (card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func shuffle () {
        model.shuffle()
    }
    
}
