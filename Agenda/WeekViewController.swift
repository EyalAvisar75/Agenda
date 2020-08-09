//
//  MonthViewController.swift
//  Agenda
//
//  Created by eyal avisar on 31/07/2020.
//  Copyright © 2020 eyal avisar. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TimeCollectionCellDelegate {
    //check how to add another table as a child and how to fix it with its own datasource/delegate

    @IBOutlet weak var monthTable: UITableView! //actually a week table
    
    let childEventTable = EventsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAlert))
        
        addTableEventController()
        
        monthTable.delegate = self
        monthTable.dataSource = self
        
        monthTable.register(UINib(nibName: "TimeTableCell", bundle: nil), forCellReuseIdentifier: "MonthCell")
        
        TimeUnit.unit = 7
    }
    
    func addTableEventController() {
        addChild(childEventTable)
        view.addSubview(childEventTable.view)
        
        childEventTable.view.frame = CGRect(x: 0, y: Double(view.frame.size.height / 4), width: Double(view.frame.size.width), height: Double(view.frame.size.height)/4 * 3)
        childEventTable.didMove(toParent: self)
        
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
