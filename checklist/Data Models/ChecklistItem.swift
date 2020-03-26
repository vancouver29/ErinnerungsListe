//
//  ChecklistItem.swift
//  checklist
//
//  Created by Khanh Bui on 24.02.20.
//  Copyright © 2020 Khanh Bui. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable{
    var text = ""
    var checked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
    
    func toggleChecked() {
        checked = !checked
    }
}
