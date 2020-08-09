//
//  AlertSettingsTableController.swift
//  Agenda
//
//  Created by eyal avisar on 02/08/2020.
//  Copyright © 2020 eyal avisar. All rights reserved.
//

import UIKit
import UserNotifications

class AlertSettingsTableController: UITableViewController {

    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    @IBOutlet weak var startAlertLabel: UILabel!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startDatePicker.isHidden = true
        endDatePicker.isHidden = true
        startAlertLabel.text = "\(Calendar.current.monthSymbols[currentMonth]) \(currentWeekDay), \(currentYear) \(hour)"
        
        //build model array to hold alerts.
        //this is to be used only in case of alarm setting
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
        //this is to be used only in case of alarm setting
        //otherwise, write it as an entry in a table
        let alertContent = UNMutableNotificationContent()
        alertContent.title = alert?.eventName ?? ""
        alertContent.body = "You have schedueled an event"
        
        let date:Date? = alert?.startTime//(alert?.alarm)//ToDo worked once! for alert?.startTime why not this way? why once?
        
        guard let givenDate = date else {return}
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: givenDate)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: alertContent, trigger: trigger)
        center.add(request) { (error) in
            
        }
    }
    
    //MARK: alert building functions
    @IBAction func startAlert(_ sender: UIDatePicker) {
        print("print \(sender.date)")

        if alert == nil {
            alert = MyAlert()
            alert?.startTime = sender.date
        }
        else {
            alert?.startTime = sender.date
        }
        alert?.printAlert()
    }
    
    @IBAction func endAlert(_ sender: UIDatePicker) {
        print("print \(sender.date)")

        if alert == nil {
            alert = MyAlert()
            alert?.endTime = sender.date
        }
        else {
            alert?.endTime = sender.date
        }
        alert?.printAlert()
    }
    
    
    @IBAction func getEventName(_ sender: UITextField) {
        if alert == nil {
            alert = MyAlert()
            alert?.eventName = sender.text
        }
        else {
            alert?.eventName = sender.text
        }
        alert?.printAlert()
        print(alert?.eventName!)
    }
    
    @IBAction func showAlarm(_ sender: Any) {
        guard let alarmController = storyboard?.instantiateViewController(withIdentifier: "AlarmTable") else { return }
        navigationController?.pushViewController(alarmController, animated: true)
    }

    func showRepeatTable() {
        guard let repeatController = storyboard?.instantiateViewController(withIdentifier: "RepeatTable") else { return }
        navigationController?.pushViewController(repeatController, animated: true)
    }
    
    func showEndRepeatTable() {
        guard let endRepeatController = storyboard?.instantiateViewController(withIdentifier: "EndRepeatTable") else { return }
        navigationController?.pushViewController(endRepeatController, animated: true)
    }
    
    //MARK: table view data source and delegate
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
        
        if indexPath.row == 5 {
            showRepeatTable()
            return
        }
        
        if indexPath.row == 6 {
            showEndRepeatTable()
            return
        }
        
        if indexPath.row == 7 {
            guard let timeTableController = storyboard?.instantiateViewController(withIdentifier: "TravelTime") else { return }
            navigationController?.pushViewController(timeTableController, animated: true)
            return
        }
        
        if indexPath.row != 1 && indexPath.row != 3 {
            endDatePicker.isHidden = true
            startDatePicker.isHidden = true
        }
        self.tableView.reloadData()
    }
    
    
}
