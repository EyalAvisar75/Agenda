//
//  AlarmTableController.swift
//  Agenda
//
//  Created by eyal avisar on 06/08/2020.
//  Copyright © 2020 eyal avisar. All rights reserved.
//

import UIKit

class EndRepeatTableController: UITableViewController {
    
    @IBOutlet weak var never: UITableViewCell!

    @IBOutlet weak var onDate: UITableViewCell!
    
    @IBOutlet weak var endRepeatPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onDate.accessoryType = UITableViewCell.AccessoryType.none
        endRepeatPicker.isHidden = true
    }
    
    @IBAction func endRepeatingAlert(_ sender: UIDatePicker) {
        print("print \(sender.date)")

        if alert == nil {
            alert = MyAlert()
            alert?.endRepeat = sender.date
        }
        else {
            alert?.endRepeat = sender.date
        }
        alert?.printAlert()
        print(alert?.endRepeat)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row != 2 {
            return tableView.rowHeight
        }
        
        if indexPath.row == 2 {
            if endRepeatPicker.isHidden {
                return 0
            }
            return 200
        }
        return tableView.rowHeight
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            endRepeatPicker.isHidden.toggle()
            never.accessoryType = UITableViewCell.AccessoryType.none
            onDate.accessoryType = UITableViewCell.AccessoryType.checkmark

        }
        
        if indexPath.row != 1  {
            endRepeatPicker.isHidden = true
            onDate.accessoryType = UITableViewCell.AccessoryType.none
            never.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        self.tableView.reloadData()
    }
    
}
