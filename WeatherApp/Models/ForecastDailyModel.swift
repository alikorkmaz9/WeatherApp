//
//  ForecastDailyModel.swift
//  WeatherApp
//
//  Created by Aybek Can Kaya on 25.06.2021.
//

import Foundation

struct ForecastDailyModel {
    var listForecastData: [ForecastDataModel] = []
    var listForecastDate: Date = Date()
    
    func getDay() -> String {
        return listForecastDate.dayOfTheWeek()
    }
}
