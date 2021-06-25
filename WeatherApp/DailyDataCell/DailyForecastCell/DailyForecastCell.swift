//
//  DailyForecastCell.swift
//  WeatherApp
//
//  Created by Ali Korkmaz on 24.06.2021.
//

import UIKit
import Kingfisher

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
    
    /**
     if let dummy = icon.weather?[0].icon {

                                      let baseUrl = "http://openweathermap.org/img/w/"

                                      forecastDataSource.imageUrl.append(URL(string: baseUrl + dummy + ".png")!)
     */
    
    func update(with model: ForecastDataModel) {
        timeLabel.text = model.date.hourOfTheDay()
        tempLabel.text = "\(model.temp)"
        let baseUrl = "http://openweathermap.org/img/w/"
        let imageUrl = baseUrl + "\(model.id).png"
        image.kf.setImage(with: URL(string: imageUrl)!)
    }

}
