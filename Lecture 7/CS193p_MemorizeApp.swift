//
//  CS193p_MemorizeApp.swift
//  Shared
//
//  Created by Troy Thomas York on 7/31/21.
//

import SwiftUI

@main
struct CS193p_MemorizeApp: App {
   private  let game = EmojiMemoryGameViewModel()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
