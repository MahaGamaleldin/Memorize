//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Maha Gamaleldeen on 30/07/2024.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card

    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "❄️", "🧙", "😱", "👹", "🙀", "☠️", "🍭"]
        
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]

            } else {
                return "!?"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    var color: Color {
        .orange
    }
    
    //MARK: - Intents
    
    // intent function i.e about user's intent
    func chooseCard (card: Card) {
        model.choose(card: card)
    }
    
    func shuffle () {
        model.shuffle()
    }
    
}
