//
//  Checklist.swift
//  checklist
//
//  Created by Khanh Bui on 06.03.20.
//  Copyright © 2020 Khanh Bui. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem]()
    var iconName = "No Icon"
    
    init(name: String) {
        self.name = name
        super.init()
    }

    // Counting the unchecked items
    func countUncheckedItems() -> Int {
//        var count = 0
//        for item in items where !item.checked {
//            count += 1
//        }
//        return count
        return items.reduce(0) {cnt, item in cnt + (item.checked ? 0 : 1)}
    }
}
