//
//  Time.swift
//  ShakeResist
//
//  Created by Malkiel Asher on 5/6/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//
/*
File Description: This file holds the time property along with it's initializer.
*/

import Foundation

struct Time {
    let time: Date

    init(timestamp: Date) {
        self.time = timestamp
    }
}
