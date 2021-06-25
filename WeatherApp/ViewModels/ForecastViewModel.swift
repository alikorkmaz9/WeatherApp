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

class ForecastViewModel {
    private let apiService = APIService()
    private(set) var responseModel: ForecastResponseModel!
    private(set) var dailyArray: [ForecastDailyModel] = []
    var delegate: ForecastViewModelDelegate?
   
    public func requestForecastModel() {
        apiService.request { (response, error) in
            self.responseModel = response!
            self.dailyArray = self.createForecastDailyModels(from: response!.forecastList)
            guard let delegate = self.delegate else { return }
            delegate.forecastViewModelDidGetData()
        }
    }
    
    private func createForecastDailyModels(from dataModels: [ForecastDataModel]) -> [ForecastDailyModel] {
        var dctForecast: [String: [ForecastDataModel]] = [:]
        var dctDate: [String: Date] = [:]
        
        let calendar = Calendar.current
        dataModels.forEach { (dataModel) in
            let year = calendar.component(.year, from: dataModel.date)
            let month = calendar.component(.month, from: dataModel.date)
            let day = calendar.component(.day, from: dataModel.date)
            
            let identifier = "\(year)-\(month)-\(day)"
            if dctForecast.keys.contains(identifier) {
                var arr = dctForecast[identifier]!
                arr.append(dataModel)
                dctForecast[identifier] = arr
            } else {
                var arr: [ForecastDataModel] = []
                arr.append(dataModel)
                dctForecast[identifier] = arr
                dctDate[identifier] = dataModel.date
            }
        }
        
        let arrDailyModels: [ForecastDailyModel] = dctForecast.map { (key,value)  in
            return ForecastDailyModel(listForecastData: value, listForecastDate: dctDate[key]!)
        }.sorted { (modelA, modelB) -> Bool in
            return modelA.listForecastDate < modelB.listForecastDate
        }
        
        return arrDailyModels
    }
    
}

