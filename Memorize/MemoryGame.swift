//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Maha Gamaleldeen on 30/07/2024.
//

import Foundation

struct MemoryGame <CardContent> where CardContent: Equatable {
    
    private (set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        
        cards  = []
        // add numberOfPairsOfCards * 2 to the cards array
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    func choose(card: Card) {
        
    }
    
    mutating func shuffle () {
        cards.shuffle()
        print(cards)
    }
    
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        
        var id: String
        
        var debugDescription: String {
            "\(id) \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
        
        
    }
    
    
}
