//
//  StructExample.swift
//  StructvsClass
//
//  Created by 김희진 on 2022/05/30.
//

import Foundation

struct StructSuperhero{
    var name: String
    var universe: String

    mutating func reverseName() {
        self.name = String(self.name.reversed())
    }
}
