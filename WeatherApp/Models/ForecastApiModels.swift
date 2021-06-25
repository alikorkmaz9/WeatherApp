//
//  ForecastApiModels.swift
//  WeatherApp
//
//  Created by Aybek Can Kaya on 25.06.2021.
//

import Foundation

struct ForecastResponseModel {
    let cod: String
    let message: Int
    let cnt: Int
    let forecastList: [ForecastDataModel]
    let city: ForecastCityDataModel
}

struct ForecastDataModel {
    var date: Date
    var temp: Double
    var id: String
    var main: String
}

struct ForecastCityDataModel {
    var name: String
}
