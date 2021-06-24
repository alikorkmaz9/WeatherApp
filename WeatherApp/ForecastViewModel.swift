//
//  ForecastViewModel.swift
//  WeatherApp
//
//  Created by Ali Korkmaz on 24.06.2021.
//


import Foundation

protocol ForecastViewModelDelegate {
    func forecastViewModelDidGetData()
}

struct ForecastDailyModel {
    var listForecastData: [ForecastDataModel] = []
    var date: Date
}
class ForecastViewModel {
    private let apiService = APIService()
    private var dailyArray: [ForecastDailyModel] = []
    public func requestForecastModel() {
        apiService.request { (response, error) in
            
        }
    }
    
}

