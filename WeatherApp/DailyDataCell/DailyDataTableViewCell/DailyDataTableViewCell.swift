//
//  DailyDataTableViewCell.swift
//  WeatherApp
//
//  Created by Ali Korkmaz on 24.06.2021.
//

import UIKit

class DailyDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    private var dailyModel: ForecastDailyModel!
    
    static let identifier = "DailyDataTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DailyDataTableViewCell", bundle: nil)
    }
    
    func update(with model: ForecastDailyModel) {
        self.dailyModel = model
        dayLabel.text = model.getDay()
        self.forecastCollectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.forecastCollectionView.register(DailyForecastCell.nib(), forCellWithReuseIdentifier: DailyForecastCell.identifier)
        self.forecastCollectionView.delegate = self
        self.forecastCollectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//MARK: -DailyDataCollectionView
extension DailyDataTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dailyModel.listForecastData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyForecastCell.identifier, for: indexPath) as! DailyForecastCell
        let model = self.dailyModel.listForecastData[indexPath.row]
        cell.update(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 140)
    }
    
    
}
