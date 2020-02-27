//
//  CookProgram.swift
//  GuidedCooking
//
//  Created by Kathleen Monje on 2/24/20.
//  Copyright © 2020 Kathleen Monje. All rights reserved.
//

import UIKit

class CookProgram {

    //MARK: Properties

    let name: String
    let id: UUID
    let photo: UIImage?
    let description: String?

    //MARK: Initialization
    init?(name: String, photo: UIImage?, description: String?) {
        // Initialization should fail if there is no name
        //no name OR contains an Emoji it will reject it and substitute it with a nill
        guard !name.isEmpty && !name.containsEmoji
        else{
            return nil
        }

        // Initialize stored properties.
        self.name  = name
        self.id    = UUID()
        self.photo = photo
        self.description = description
    }
}

extension Character {
    /// A simple emoji is one scalar and presented to the user as an Emoji
    var isSimpleEmoji: Bool {
        guard let firstProperties = unicodeScalars.first?.properties else {
            return false
        }
        return unicodeScalars.count == 1 &&
            (firstProperties.isEmojiPresentation ||
                firstProperties.generalCategory == .otherSymbol)
    }

    /// Checks if the scalars will be merged into an emoji
    var isCombinedIntoEmoji: Bool {
        return (unicodeScalars.count > 1 &&
               unicodeScalars.contains { $0.properties.isJoinControl || $0.properties.isVariationSelector })
            || unicodeScalars.allSatisfy({ $0.properties.isEmojiPresentation })
    }

    var isEmoji: Bool {
        return isSimpleEmoji || isCombinedIntoEmoji
    }
}

extension String {
    var isSingleEmoji: Bool {
        return count == 1 && containsEmoji
    }

    var containsEmoji: Bool {
        return contains { $0.isEmoji }
    }

    var containsOnlyEmoji: Bool {
        return !isEmpty && !contains { !$0.isEmoji }
    }

    var emojiString: String {
        return emojis.map { String($0) }.reduce("", +)
    }

    var emojis: [Character] {
        return filter { $0.isEmoji }
    }

    var emojiScalars: [UnicodeScalar] {
        return filter{ $0.isEmoji }.flatMap { $0.unicodeScalars }
    }
}
