//
//  EmojiMemoryGame.swift
//  CS193p-Memorize
//
//  Created by Troy York on 7/15/21.
//VIEW MODEL

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    @Published private var themeModel: Theme<Color>
    
    static func createMemoryGame(with theme: Theme<Color>) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.pairsOfCards) { pairIndex in theme.emojis[pairIndex] }
        }
    init() {
        let theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
        themeModel = theme
    }
   
    
    var score: Int { model.score }
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
   
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) { model.choose(card) }
    func newGame() {
        let theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
        themeModel = theme
    }
    //MARK: - Themes
    private static let themes: [Theme<Color>] = [
        Theme(name: "Cars", emojis: ["๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ป", "๐", "๐", "๐", "๐ฆฝ", "๐ฆผ", "๐ด", "๐ฒ", "๐ต", "๐", "๐บ", "๐", "๐", "๐"], color: "Red"),
        Theme(name: "Hearts", emojis:  ["โค๏ธ", "๐งก", "๐", "๐", "๐", "๐", "๐ค", "๐ค", "๐ค", "๐", "โค๏ธโ๐ฅ", "โค๏ธโ๐ฉน", "โฃ๏ธ", "๐", "๐", "๐", "๐", "๐", "๐"]
              , color: "Gray"),
        Theme(name: "Activities", emojis: ["๐ฟ", "โท", "๐", "๐ช", "๐๏ธโโ๏ธ", "๐คผโโ๏ธ", "๐คธโโ๏ธ", "โน๏ธ", "๐คบ", "๐คพโโ๏ธ", "๐๏ธโโ๏ธ", "๐", "๐โโ๏ธ", "๐โโ๏ธ", "๐ฃโโ๏ธ", "๐งโโ๏ธ", "๐ต"], color: "Blue"),
        Theme(name: "Animals", emojis: ["๐ฆ", "๐ฌ", "๐ณ", "๐ฆง", "๐", "๐ช", "๐ฆ", "๐ฆ", "๐", "๐ฆฆ", "๐ฆ", "๐ฆฅ", "๐ฆฌ", "๐ฆ", "๐ข"], color: "Orange"),
        Theme(name: "Fruits", emojis: ["๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ซ", "๐", "๐", "๐", "๐"], color: "Green"),
        Theme(name: "Electronics", emojis: ["โ๏ธ", "๐ฑ", "๐ป",   "๐ฅ", "๐จ", "๐ท", "๐บ", "๐", "๐ก", "๐ฆ", "โฐ", "๐งญ", "๐ฅ", "๐พ", "๐น", "๐ผ"], color: "Yellow")
    ]
}
   

