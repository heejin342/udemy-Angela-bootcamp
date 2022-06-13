//
//  Category3.swift
//  Todoey
//
//  Created by 김희진 on 2022/06/13.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category3: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    let items = List<Item3>()
}
