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
        func collectionView(collectionviewcell: TimeCollectionCell?, index: Int, didTappedInTableViewCell: MonthTableCell)

}

//MARK: extension

extension MonthTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    func updateCellWith(row: [CollectionViewCellModel]) {
//        self.rowWithColors = row
//        self.collectionView.reloadData()
//    }
    
    //MARK: extension UICollectionViewDataSource,
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 31
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Set the data for each cell (color and color name)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayCell", for: indexPath) as? TimeCollectionCell {
            
            cell.dayLabel.text = "\(indexPath.row + 1)"
            return cell
        }
        return UICollectionViewCell()
    }
    
    //MARK: extension UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = calendarCollection.cellForItem(at: indexPath) as? TimeCollectionCell
        self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)

    }
    
    //MARK: extension UICollectionViewDelegateFlowLayout
    // Add spaces at the beginning and the end of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}

//MARK: class MonthTableCell
class MonthTableCell: UITableViewCell {

    @IBOutlet var monthLabel:UILabel!
    @IBOutlet var calendarCollection:UICollectionView!
    
    weak var cellDelegate: TimeCollectionCellDelegate?

    var row:[TimeCollectionCellModel]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 50, height: 50)
        flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 5.0
        calendarCollection.collectionViewLayout = flowLayout
//        calendarCollection.showsHorizontalScrollIndicator = false
        
        calendarCollection.dataSource = self
        calendarCollection.delegate = self
               
               // Register the xib for collection view cell
        let cellNib = UINib(nibName: "TimeCollectionCell", bundle: nil)
        calendarCollection.register(cellNib, forCellWithReuseIdentifier: "DayCell")
           

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
