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
    
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
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
    
    // sort item by due dates
    func sortChecklistItems() {
        return items.sort(by: { item1, item2 in
            return item1.dueDate.compare(item2.dueDate) == .orderedAscending
        })
//        return items.sort {
//            $0.dueDate < $1.dueDate
//        }
    }
}
