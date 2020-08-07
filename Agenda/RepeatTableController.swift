//
//  RepeatTableController.swift
//  Agenda
//
//  Created by eyal avisar on 06/08/2020.
//  Copyright © 2020 eyal avisar. All rights reserved.
//

import UIKit

class RepeatTableController: UITableViewController {

    @IBOutlet weak var never: UITableViewCell!
    @IBOutlet weak var everyDay: UITableViewCell!
    @IBOutlet weak var everyWeek: UITableViewCell!
    
    @IBOutlet weak var every2Weeks: UITableViewCell!
    @IBOutlet weak var everyMonth: UITableViewCell!
    @IBOutlet weak var everyYear: UITableViewCell!
    @IBOutlet weak var custom: UITableViewCell!

    var lastPressed = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        changeToNone()
//        switch lastPressed {
//        case 0:
//            never.accessoryType = .none
//        case 1:
//            everyDay.accessoryType = .none
//        case 2:
//            everyWeek.accessoryType = .none
//        case 3:
//            every2Weeks.accessoryType = .none
//        case 4:
//            everyMonth.accessoryType = .none
//        case 5:
//            everyYear.accessoryType = .none
//        case 6:
//            custom.accessoryType = .none
//        default:
//            never.accessoryType = .none
//        }
//
        if alert == nil {
            alert = MyAlert()
        }
        switch indexPath.row {
        case 0:
            never.accessoryType = .checkmark
            alert?.repeating = "Never"
        case 1:
            everyDay.accessoryType = .checkmark
            alert?.repeating = "Daily"
        case 2:
            everyWeek.accessoryType = .checkmark
            alert?.repeating = "Weekly"
        case 3:
            every2Weeks.accessoryType = .checkmark
            alert?.repeating = "Biweekly"
        case 4:
            everyMonth.accessoryType = .checkmark
            alert?.repeating = "Monthly"
        case 5:
            everyYear.accessoryType = .checkmark
            alert?.repeating = "Yearly"
        case 6:
            custom.accessoryType = .checkmark
            alert?.repeating = "Custom"
        default:
            never.accessoryType = .none
            alert?.repeating = "Never"
        }
        lastPressed = indexPath.row
        print("repeat: \(alert?.repeating)")
    }
    
    
    @IBAction func customTapped(_ sender: Any) {
        custom.accessoryType = .checkmark
        if alert == nil {
            alert = MyAlert()
        }
        alert?.repeating = "Custom"

        changeToNone()
        lastPressed = 6
    }
    
    func changeToNone() {
        switch lastPressed {
        case 0:
            never.accessoryType = .none
        case 1:
            everyDay.accessoryType = .none
        case 2:
            everyWeek.accessoryType = .none
        case 3:
            every2Weeks.accessoryType = .none
        case 4:
            everyMonth.accessoryType = .none
        case 5:
            everyYear.accessoryType = .none
        case 6:
            custom.accessoryType = .none
        default:
            never.accessoryType = .none
        }
    }
}
