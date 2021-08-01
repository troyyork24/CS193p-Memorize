//
//  EmojiMemoryGame.swift
//  CS193p-Memorize
//
//  Created by Troy York on 7/15/21.
//VIEW MODEL

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚀"]
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex  in
            emojis[pairIndex]
        }
    }
    @Published private var model = createMemoryGame()
    var cards: Array<MemoryGame<String>.Card> {
         model.cards
        }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
