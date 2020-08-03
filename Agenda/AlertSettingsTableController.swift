//
//  AlertSettingsTableController.swift
//  Agenda
//
//  Created by eyal avisar on 02/08/2020.
//  Copyright © 2020 eyal avisar. All rights reserved.
//

import UIKit

class AlertSettingsTableController: UITableViewController {

    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    @IBOutlet weak var endDatePicker: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        startDatePicker.isHidden = true
        endDatePicker.isHidden = true
    }
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row != 2 && indexPath.row != 4 {
            return tableView.rowHeight
        }
        
        if indexPath.row == 2 {
            if startDatePicker.isHidden {
                return 0
            }
            return 200
        }
        
        if indexPath.row == 4 {
            if endDatePicker.isHidden {
                return 0
            }
            return 200
        }
            
        return tableView.rowHeight
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            startDatePicker.isHidden.toggle()
            if !startDatePicker.isHidden {
                endDatePicker.isHidden = true
            }
        }
        
        if indexPath.row == 3 {
            endDatePicker.isHidden.toggle()
            if !endDatePicker.isHidden {
                startDatePicker.isHidden = true
            }
        }
        
        if indexPath.row != 1 && indexPath.row != 3 {
            endDatePicker.isHidden = true
            startDatePicker.isHidden = true
        }
        
        self.tableView.reloadData()
    }
    
    
}
