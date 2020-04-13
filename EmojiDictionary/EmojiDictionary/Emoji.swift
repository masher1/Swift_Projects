//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Malkiel Asher on 4/8/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import Foundation

class Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String

    init(symbol: String, name: String, description: String, usage: String){
        self.symbol = symbol
        self.description = description
        self.name = name
        self.usage = usage
    }
}
