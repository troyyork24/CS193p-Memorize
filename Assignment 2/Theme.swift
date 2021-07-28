//
//  Theme.swift
//  CS193p-Memorize
//
//  Created by Troy York on 7/20/21.
//

import Foundation

struct Theme<Content> {
    var name: String
    var emojis: [String]
    var pairsOfCards: Int {
        Int.random(in: 4..<emojis.count)
    }
    var color: String
}
