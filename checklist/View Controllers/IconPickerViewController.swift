//
//  IconPickerViewController.swift
//  checklist
//
//  Created by Khanh Bui on 22.03.20.
//  Copyright © 2020 Khanh Bui. All rights reserved.
//

import Foundation
import UIKit

protocol IconPickerViewControllerDelegate: class  {
    func iconPicker(_ picker: IConPickerViewController, didPick iconName: String)
}

class IConPickerViewController: UITableViewController {
    weak var delegate: IconPickerViewControllerDelegate?
    let icons = [ "No Icon", "Appointments", "Birthdays", "Chores",
     "Drinks", "Folder", "Groceries", "Inbox", "Photos", "Trips" ]
    
    //MARK:- Table View Delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath)
        let iconName = icons[indexPath.row]
        cell.textLabel!.text = iconName
        cell.imageView!.image = UIImage(named: iconName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            let iconName = icons[indexPath.row]
            delegate.iconPicker(self, didPick: iconName)
        }
    }
}

