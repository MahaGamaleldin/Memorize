//
//  Cardify.swift
//  Memorize
//
//  Created by Maha Gamaleldeen on 14/08/2024.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    let isFaceUp: Bool
    
    func body (content: Content) -> some View {
        
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.corberRadius)
           
            base.stroke(lineWidth: Constants.lineWidth)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
            base.fill()
                .opacity(isFaceUp ? 0 : 1)
        }
    }
    
    private struct Constants {
        
        static let corberRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2

    }
    
    
}

extension View {
    func cardify (isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
