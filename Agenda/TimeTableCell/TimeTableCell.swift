//
//  MonthTableCell.swift
//  Agenda
//
//  Created by eyal avisar on 30/07/2020.
//  Copyright © 2020 eyal avisar. All rights reserved.
//

import UIKit

//MARK: protocol TimeCollectionCellDelegate
protocol TimeCollectionCellDelegate: class {
        func collectionView(collectionviewcell: DayCollectionCell?, index: Int, didTappedInTableViewCell: TimeTableCell)

}

//MARK: extension

extension TimeTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: extension UICollectionViewDataSource,
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TimeUnit.unit
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Set the data for each cell (color and color name)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayCell", for: indexPath) as? DayCollectionCell {
            
            let currentFirstDay = getFirstDayOfMonth(requiredMonth: currentMonth, requiredYear: currentYear)
                     
            //ToDo no day 0!
            if TimeUnit.unit == 7 {
                cell.dayLabel.text = "\((currentWeekDay + indexPath.row) % currentLastDay)"
                if indexPath.row == 0 {
                    cell.dayLabel.backgroundColor = .yellow
                }
                return cell
            }
            if indexPath.row < currentFirstDay {
                cell.isHidden = true
            }
            
            //ToDo for some reason i need that... and the months are not coordinated well february shows up in november??!!
            if indexPath.row + 1 - currentFirstDay > currentLastDay {
                cell.isHidden = true
            }
            cell.dayLabel.text = "\(indexPath.row + 1 - currentFirstDay)"
            if (indexPath.row + 1 - currentFirstDay) == day {
                if currentYear == year && currentMonth == month {
                    cell.backgroundColor = .green
                }
            }
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    //MARK: extension UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = calendarCollection.cellForItem(at: indexPath) as? DayCollectionCell
        self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)

    }
    
    //MARK: extension UICollectionViewDelegateFlowLayout
    // Add spaces at the beginning and the end of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}

//MARK: class MonthTableCell
class TimeTableCell: UITableViewCell {

    @IBOutlet var monthLabel:UILabel!
    @IBOutlet var calendarCollection:UICollectionView!
    
    weak var cellDelegate: TimeCollectionCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 50, height: 50)
        flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 5.0
        calendarCollection.collectionViewLayout = flowLayout

        
        calendarCollection.dataSource = self
        calendarCollection.delegate = self
               
               // Register the xib for collection view cell
        let cellNib = UINib(nibName: "DayCollectionCell", bundle: nil)
        calendarCollection.register(cellNib, forCellWithReuseIdentifier: "DayCell")
           

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
