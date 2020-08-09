//
//  EventsViewController.swift
//  Agenda
//
//  Created by eyal avisar on 07/08/2020.
//  Copyright © 2020 eyal avisar. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let eventTableView:UITableView = {
        let table = UITableView(frame: .zero)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        view.addSubview(eventTableView)

        eventTableView.dataSource = self
        eventTableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        eventTableView.frame = view.bounds
    }
    //MARK: table datasource, delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let date = alert?.startTime else {
            return cell
        }
        
        let components = Calendar.current.dateComponents([.year, .month, .day,.hour], from: date)
        
        //ToDo - week day is 0-6? components.day is 0...30?
        if currentYear == components.year && currentMonth == components.month
        && indexPath.row == components.hour {//&& currentWeekDay == components.day 
            cell.textLabel?.text = alert?.eventName ?? " schedueled event"  + "event"
        }
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
