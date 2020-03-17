//
//  DataModel.swift
//  checklist
//
//  Created by Khanh Bui on 17.03.20.
//  Copyright © 2020 Khanh Bui. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [Checklist]()

    init() {
        loadChecklists()
    }

    //MARK:- Data Saving
    func documentsDirectory () -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    // Saving data to file
    func saveChecklists() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print ("Error encoding item array: \(error.localizedDescription)")
        }
    }
    // Reading data from a file
    func loadChecklists() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                lists = try decoder.decode([Checklist].self, from: data)
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
}
