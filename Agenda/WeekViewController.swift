//
//  MonthViewController.swift
//  Agenda
//
//  Created by eyal avisar on 31/07/2020.
//  Copyright © 2020 eyal avisar. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TimeCollectionCellDelegate {
    

    @IBOutlet weak var monthTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAlert))
        
        monthTable.delegate = self
        monthTable.dataSource = self
        
        monthTable.register(UINib(nibName: "TimeTableCell", bundle: nil), forCellReuseIdentifier: "MonthCell")
        
        TimeUnit.unit = 7
    }
    
    
    @objc func addAlert() {
        guard let monthView  = storyboard?.instantiateViewController(withIdentifier: "AlertSettings") else { return }
        
        navigationController?.pushViewController(monthView, animated: true)
    }
    //MARK: table delegate + table datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MonthCell", for: indexPath) as! TimeTableCell

            cell.cellDelegate = self
            let monthLabelText = Calendar.current.monthSymbols[currentMonth]
            cell.monthLabel.text = "\(monthLabelText)"
            return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 350
    }
    
    // MARK: - TimeCollectionCellDelegate
    func collectionView(collectionviewcell: DayCollectionCell?, index: Int, didTappedInTableViewCell: TimeTableCell) {
        
        let day = Int((collectionviewcell?.dayLabel.text!)!)!
        currentWeekDay = day
        collectionviewcell?.dayLabel.backgroundColor = .green
    }
}
