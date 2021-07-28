//
//  EmojiMemoryGame.swift
//  CS193p-Memorize
//
//  Created by Troy York on 7/15/21.
//VIEW MODEL

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static func createMemoryGame(with theme: Theme<Color>) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.pairsOfCards) { pairIndex in theme.emojis[pairIndex] }
        }
    init() {
        let theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
        themeModel = theme
    }
   
    @Published private var model: MemoryGame<String>
    @Published private var themeModel: Theme<Color>
    
    var cards: Array<MemoryGame<String>.Card> { model.cards }
    var themeName: String { themeModel.name }
    var themeColor: Color {
        let stringColor = themeModel.color
        switch stringColor {
            case "Red":
                return .red
            case "Blue":
                return .blue
            case "Gray":
                return .gray
            case "Orange":
                return .orange
            case "Green":
                return .green
            case "Yellow":
                return .yellow
            default:
                return .purple
    }
    }
    var score: Int { model.score }
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) { model.choose(card) }
    func newGame() {
        let theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
        themeModel = theme
    }
    //MARK: - Themes
    private static let themes: [Theme<Color>] = [
        Theme(name: "Cars", emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚀"], color: "Red"),
        Theme(name: "Hearts", emojis:  ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "💔", "❤️‍🔥", "❤️‍🩹", "❣️", "💕", "💞", "💓", "💖", "💝", "💘"]
              , color: "Gray"),
        Theme(name: "Activities", emojis: ["🎿", "⛷", "🏂", "🪂", "🏋️‍♀️", "🤼‍♀️", "🤸‍♀️", "⛹️", "🤺", "🤾‍♀️", "🏌️‍♀️", "🏇", "🏄‍♀️", "🏊‍♀️", "🚣‍♀️", "🧗‍♀️", "🚵"], color: "Blue"),
        Theme(name: "Animals", emojis: ["🦑", "🐬", "🐳", "🦧", "🐘", "🐪", "🦒", "🦘", "🐖", "🦦", "🦔", "🦥", "🦬", "🦂", "🐢"], color: "Orange"),
        Theme(name: "Fruits", emojis: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🍍"], color: "Green"),
        Theme(name: "Electronics", emojis: ["⌚️", "📱", "💻",   "🖥", "🖨", "📷", "📺", "🎙", "📡", "🔦", "⏰", "🧭", "🎥", "💾", "🕹", "📼"], color: "Yellow")
    ]
}
   

