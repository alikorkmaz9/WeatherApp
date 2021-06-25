//
//  DailyDataTableViewCell.swift
//  WeatherApp
//
//  Created by Ali Korkmaz on 24.06.2021.
//

import UIKit

class DailyDataTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var forecastCollectionView: UICollectionView!
    var dailyModel: ForecastDailyModel!
    
    static let identifier = "DailyDataTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DailyDataTableViewCell", bundle: nil)
    }
    
    func update(with model: ForecastDailyModel) {
        dayLabel.text = model.getDay()
        self.dailyModel = model
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
