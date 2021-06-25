//
//  DailyForecastCell.swift
//  WeatherApp
//
//  Created by Ali Korkmaz on 24.06.2021.
//

import UIKit

class DailyForecastCell: UICollectionViewCell {
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    
    static let identifier = "DailyForecastCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DailyForecastCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
