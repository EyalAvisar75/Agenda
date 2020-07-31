//
//  MonthViewController.swift
//  Agenda
//
//  Created by eyal avisar on 31/07/2020.
//  Copyright © 2020 eyal avisar. All rights reserved.
//

import UIKit

class MonthViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TimeCollectionCellDelegate {
    

    @IBOutlet weak var monthTable: UITableView!
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        monthTable.delegate = self
        monthTable.dataSource = self
        
        monthTable.register(UINib(nibName: "MonthTableCell", bundle: nil), forCellReuseIdentifier: "MonthCell")
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "MonthCell", for: indexPath) as! MonthTableCell

            cell.cellDelegate = self
            cell.monthLabel.text = "\(months[indexPath.row])"
            return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 350
    }
    
    // MARK: - TimeCollectionCellDelegate

    func collectionView(collectionviewcell: TimeCollectionCell?, index: Int, didTappedInTableViewCell: MonthTableCell) {
        
        let day = index + 1
        let month = didTappedInTableViewCell.monthLabel.text!
        print("day \(day), month \(month)")
            
    }
}
