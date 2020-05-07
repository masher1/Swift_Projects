//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Malkiel Asher on 4/8/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
class Emoji: Codable {
=======
class Emoji {
>>>>>>> d11ad83d0936b39b9a47310eb82958f8c56a9ea4
    var symbol: String
    var name: String
    var description: String
    var usage: String
<<<<<<< HEAD
    
    
    static var archiveURL: URL {
        get{
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
        }
    }
=======
>>>>>>> d11ad83d0936b39b9a47310eb82958f8c56a9ea4

    init(symbol: String, name: String, description: String, usage: String){
        self.symbol = symbol
        self.description = description
        self.name = name
        self.usage = usage
    }
<<<<<<< HEAD
    
    static func saveToFile(emojis: [Emoji]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedEmojis = try? propertyListEncoder.encode(emojis)
        
        try? encodedEmojis?.write(to: Emoji.archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Emoji] {
        let propertyListDecoder = PropertyListDecoder()
        
        if let retrievedEmojiData = try? Data(contentsOf: Emoji.archiveURL), let decodeEmojis = try? propertyListDecoder.decode([Emoji].self, from: retrievedEmojiData){
            return decodeEmojis
        }
        
        return []
    }
    
    static func loadSampleEmojis() -> [Emoji]{
        let emojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", description: "A confused puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "👮🏼‍♂️", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "something slow"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk; chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion"),
        Emoji(symbol: "🥺", name: "Pleading Face", description: "A face with furrowed eyebrows, a small frown, and large, \"puppy dog\" eyes.", usage: "Adoration; feeling touched"),
        Emoji(symbol: "❤️", name: "Red Heart", description: "A classic love heart emoji.", usage: "expression of love"),
        Emoji(symbol: "😂", name: "Face with Tears of Joy", description: "A face with a big grin, uplifting eyebrows, and smiling eyes, each shedding a tear from laughing so hard", usage: "funny; pleasing"),
        Emoji(symbol: "🥰", name: "Smiling Face with Hearts", description: "A face with smiling eyes, a closed smile, rosy cheaks, and several hearts floating around its head.", usage: "affectionate feelings; being in love"),
        Emoji(symbol: "😊", name: "Smiling Face with Smiling Eyes", description: "A face with smiling eyes and a broad, closed smile turning up to rosy cheeks.", usage: "genuine happiness and warm; positive feelings"),
        Emoji(symbol: "🔥", name: "Fire", description: "A flame as produced when something is on fire.", usage: "fire; hot; lit"),
        Emoji(symbol: "👍", name: "Thumbs Up", description: "Thumbs up sign.", usage: "approval; like"),
        Emoji(symbol: "🦠", name: "Microbe", description: "A squiggly, single-celled microorganism with prominent cilia.", usage: "bacteria; virus; germs; disease")]
    
        
        return emojis
    }
=======
>>>>>>> d11ad83d0936b39b9a47310eb82958f8c56a9ea4
}
