//
//  CardView.swift
//  Memorize
//
//  Created by Maha Gamaleldeen on 13/08/2024.
//

import SwiftUI

struct CardView: View {
    
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240) )
            .opacity(Constants.Pie.opacity)
            .overlay {
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            }
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp )
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        
        static let corberRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 100
            static let scaleFactor: CGFloat = smallest / largest
        }
        
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
        
    }
}

#Preview {
//    typealias Card = MemoryGame<String>.Card
    
    VStack {
        
        HStack {
            CardView(CardView.Card(isFaceUp: true, content: "X", id: "test1"))
            CardView(CardView.Card(content: "X", id: "test1"))
        }
        
        HStack {
            CardView(CardView.Card(isFaceUp: true, isMatched: true, content: "this is a very large text that i hope it fits", id: "test1"))
            CardView(CardView.Card(isMatched: true, content: "X", id: "test1"))
        }
        
    }
    .padding()
    .foregroundColor(.green)
    
}
