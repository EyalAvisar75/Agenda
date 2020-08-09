//
//  AlarmTableController.swift
//  Agenda
//
//  Created by eyal avisar on 06/08/2020.
//  Copyright © 2020 eyal avisar. All rights reserved.
//

import UIKit

class AlarmTableController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            alert?.alarm = alert?.startTime?.addingTimeInterval(0)
        case 1:
            alert?.alarm = alert?.startTime?.addingTimeInterval(-300)
        case 2:
            alert?.alarm = alert?.startTime?.addingTimeInterval(-600)
        case 3:
            alert?.alarm = alert?.startTime?.addingTimeInterval(-900)
        case 4:
            alert?.alarm = alert?.startTime?.addingTimeInterval(-1800)
        case 5:
            alert?.alarm = alert?.startTime?.addingTimeInterval(-60*60)
        case 6:
            alert?.alarm = alert?.startTime?.addingTimeInterval(-60*60*2)
        case 7:
            alert?.alarm = alert?.startTime?.addingTimeInterval(-60*60*24)
        case 8:
            alert?.alarm = alert?.startTime?.addingTimeInterval(-60*60*24*2)
        case 9:
            alert?.alarm = alert?.startTime?.addingTimeInterval(-60*60*24*7)
        default:
            alert?.alarm = nil
        }
        print(alert?.alarm)
    }

}
