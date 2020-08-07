//
//  MonthsTableController.swift
//  Agenda
//
//  Created by eyal avisar on 30/07/2020.
//  Copyright © 2020 eyal avisar. All rights reserved.
//

import UIKit


class MonthsTableController: UITableViewController, TimeCollectionCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ToDo: why should i subtract 2 years? problem started with indicating year change in cell creation - months are not aligned. using two methods in Time.swift (Calendar, Date) is that the source?
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "\(year - 2)", style: .plain, target: self, action: #selector(showWeek))
        tableView.register(UINib(nibName: "TimeTableCell", bundle: nil), forCellReuseIdentifier: "MonthCell")
        print("m \(month), \(currentMonth), \(currentFirstDay), \(currentYear)")
    }
    
    @objc func showWeek() {
        guard let weekcontroller = storyboard?.instantiateViewController(withIdentifier: "WeekControler") else { return }
        
//        present(weekcontroller, animated: true)
        navigationController?.pushViewController(weekcontroller, animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10000
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MonthCell", for: indexPath) as! TimeTableCell

        currentMonth  = (month + indexPath.row) % 12
        currentYear = Int(navigationItem.leftBarButtonItem!.title!)! + 2
        currentLastDay = getLastDayOfMonth(requiredMonth: currentMonth % 12, requiredYear: currentYear)
        currentFirstDay = getFirstDayOfMonth(requiredMonth: currentYear, requiredYear: currentYear)
        
        print("days \(currentLastDay), first \(currentFirstDay) year \(currentYear), month \(currentMonth) row \(indexPath.row)")
        TimeUnit.unit = currentLastDay + currentFirstDay

        cell.cellDelegate = self
        if currentMonth == 0  {
            if indexPath.row != 0 {
                let year = Int(navigationItem.leftBarButtonItem!.title!)! + 1
                navigationItem.leftBarButtonItem?.title = "\(year)"
                currentYear = year
            }
        }

        let monthLabelText = Calendar.current.monthSymbols[currentMonth]
        cell.monthLabel.text = monthLabelText
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }

    // MARK: - TimeCollectionCellDelegate

    func collectionView(collectionviewcell: DayCollectionCell?, index: Int, didTappedInTableViewCell: TimeTableCell) {
        
        let day = index + 1
        let month = didTappedInTableViewCell.monthLabel.text!
        print("day \(day), month \(month)") //since i am moving the days according to day week on the first of the month - tap gives bad results
        currentWeekDay = day
        showWeek()
    }
}
