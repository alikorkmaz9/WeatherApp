//
//  DateExtensions.swift
//  WeatherApp
//
//  Created by Ali Korkmaz on 25.06.2021.
//

import Foundation

//MARK: -DateFormatter
extension Date {
    func hourOfTheDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
    
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
