//
//  APIService.swift
//  WeatherApp
//
//  Created by Ali Korkmaz on 24.06.2021.
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
    var id: Int
    var main: String
}

struct ForecastCityDataModel {
    var name: String
}

enum ForecastService {
    case izmirWeather
}

class APIService {
    
    func request(callBack: @escaping (ForecastResponseModel?, Error?) -> ()) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=izmir&APPID=bbcf57969e78d1300a815765b7d587f0&units=metric"
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 10)
        
        
        let dataTask = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let self = self else {
                callBack(nil, nil)
                return
            }
            
            if let error = error {
                callBack(nil, error)
                return
            }
            
            guard let response = response, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                callBack(nil, nil)
                return
            }
            
            let json = try! JSON(data: data!)
            let code = json["cod"].string
            let messsage = json["message"].int
            let cnt = json["cnt"].int
            var responseModel: ForecastResponseModel?
            var forecastModels: [ForecastDataModel] = []
            if let listJson = json["list"].array {
                forecastModels = listJson.map { (jsonForecast) in
                    let dt = jsonForecast["dt"].double
                    let date = Date(timeIntervalSince1970: dt!)
                    let temp = jsonForecast["main"]["temp"].double
                    let id = jsonForecast["weather"][0]["id"].int
                    let main = jsonForecast["weather"][0]["main"].string
                    let dataModel = ForecastDataModel(date: date, temp: temp!, id: id!, main: main!)
                    return dataModel
                }
                
            }
            let cityJson = json["city"]
            let name = cityJson["name"].string
            let cityModel = ForecastCityDataModel(name: name!)
            responseModel = ForecastResponseModel(cod: code!, message: messsage!, cnt: cnt!, forecastList: forecastModels, city: cityModel)
            
            DispatchQueue.main.async {
                callBack(responseModel, nil)
            }
            
            
            //            print(data)
            //            print(response)
            //            print(error)
        }
        dataTask.resume()
    }
}



