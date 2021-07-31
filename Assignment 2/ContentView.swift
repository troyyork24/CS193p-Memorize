//
//  ContentView.swift
//  CS193p-Memorize
//
//  Created by Troy York on 7/15/21.
//VIEW

import SwiftUI

struct ContentView: View {
   @ObservedObject var viewModel: EmojiMemoryGame
var body: some View {
    VStack {
        HStack {
            Text(viewModel.themeName).font(.largeTitle)
            Spacer()
            VStack{
                Text("Score")
                Text("\(viewModel.score)")
            }
        }   .padding()
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card, themeColor: viewModel.themeColor).aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            .padding(.horizontal)
        }
        Button("New Game") { viewModel.newGame() }
            .padding()
    }
}
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    let themeColor: Color
var body: some View {
    ZStack {
        let shape = RoundedRectangle(cornerRadius: 20)
        if card.isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3).foregroundColor(themeColor)
            Text(card.content).font(.largeTitle)
        } else if card.isMatched {
            shape.opacity(0)
        } else {
            shape.fill().foregroundColor(themeColor)
    }
    }
}}


struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    let game = EmojiMemoryGame()
    ContentView(viewModel: game)
        .preferredColorScheme(.dark)
//    ContentView(viewModel: game)
//        .preferredColorScheme(.light)
}}
