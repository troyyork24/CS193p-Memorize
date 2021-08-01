//
//  ContentView.swift
//  CS193p-Memorize
//
//  Created by Troy York on 7/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var themeSelector: EmojiThemes = .car
    var body: some View {
        VStack {
            Text("Memorize!").foregroundColor(.black).font(.title)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(themeSelector.emojis.shuffled()[0..<themeSelector.originalPairCount * 2], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }}}
                .foregroundColor(themeSelector.foregroundColor)
            Spacer()
            HStack {
                Spacer()
                Button(action: {themeSelector = .car}, label: {
                        VStack {
                            Image(systemName: "car")
                            Text(EmojiThemes.car.title)
                                .font(.caption)
                        }
                        .foregroundColor(EmojiThemes.car.foregroundColor)
                })
                Spacer()
                Button(action: {themeSelector = .picto}, label: {
                        VStack {
                            Image(systemName: "sun.max")
                            Text(EmojiThemes.picto.title)
                        }
                        .foregroundColor(EmojiThemes.picto.foregroundColor)
                        .font(.caption)
                })
                Spacer()
                Button(action: {themeSelector = .activities}, label: {
                        VStack {
                            Image(systemName: "sportscourt")
                            Text(EmojiThemes.activities.title)
                                .font(.caption)
                        }
                        .foregroundColor(EmojiThemes.activities.foregroundColor)
                })
                Spacer()
            }}
            .padding(.horizontal)
    }
    enum EmojiThemes: CaseIterable {
        case car, picto, activities
        var title: String {
            switch self {
                case .car:
                    return "Cars"
                case .picto:
                    return "Pictographs"
                case .activities:
                    return "Activities"
            }
        }
        var systemName: String {
            switch self {
                case .car:
                    return "car"
                case .picto:
                    return "sun.max"
                case .activities:
                    return "suit.spade"
            }
        }
        var emojis: [String] {
            switch self {
                case .car:
                    return ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚀"]
                case .picto:
                    return ["☀︎", "☼", "☽", "☾", "☁︎", "☂︎", "☃︎", "☆", "♤", "♕", "♔", "⚛︎"]
                case .activities:
                    return ["🎿", "⛷", "🏂", "🪂", "🏋️‍♀️", "🤼‍♀️", "🤸‍♀️", "⛹️", "🤺", "🤾‍♀️", "🏌️‍♀️", "🏇", "🏄‍♀️", "🏊‍♀️", "🚣‍♀️", "🧗‍♀️", "🚵"]
            }
        }
        var originalPairCount: Int {
            Int.random(in: 4..<(emojis.count / 2))
        }
        var foregroundColor: Color {
            switch self {
                case .car:
                    return .red
                case .picto:
                    return .black
                case .activities:
                    return .yellow
            }
        }
    }
}
struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
