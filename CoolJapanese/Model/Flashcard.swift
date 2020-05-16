//
//  Flashcard.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/7/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import Foundation
import RealmSwift
class Flashcard : Object {
    @objc dynamic var name: String = ""
    @objc dynamic var learned: Int = 0
    @objc dynamic var total: Int = 0
    @objc dynamic var color: String = ""
    @objc dynamic var words: [Words]?
}
class Word {
    var remember : Bool = false
    var content: String = ""
    var note: String = ""
}
class Words : Object {
    @objc dynamic var remember : Bool = false
    @objc dynamic var content: String = ""
    @objc dynamic var note: String = ""
}
