//
//  MonthsTableController.swift
//  Agenda
//
//  Created by eyal avisar on 30/07/2020.
//  Copyright © 2020 eyal avisar. All rights reserved.
//

import UIKit


class MonthsTableController: UITableViewController, TimeCollectionCellDelegate {

    let months = ["January", "February", "March", "April", "May", "June", "July", "Augost", "September", "October", "November", "December"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "MonthTableCell", bundle: nil), forCellReuseIdentifier: "MonthCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return months.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MonthCell", for: indexPath) as! MonthTableCell

        cell.cellDelegate = self
        cell.monthLabel.text = "\(months[indexPath.row])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }

    // MARK: - TimeCollectionCellDelegate

    func collectionView(collectionviewcell: TimeCollectionCell?, index: Int, didTappedInTableViewCell: MonthTableCell) {
        
        let day = index + 1
        print("you chose \(day)")
            
    }
}
