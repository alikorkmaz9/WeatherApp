//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Aybek Can Kaya on 28.06.2021.
//

import Foundation

protocol SearchViewModelDelegate: class {
    func searchViewModelShouldUpdateTableView()
    func searchViewModelUpdateVisibilityOfTable(isShowing: Bool)
}

class SearchViewModel {
    private weak var delegate: SearchViewModelDelegate?
    private var cityArray: [String] = []
    private var searchKeyword: String = ""
    private(set) var filteredCityArray: [String] = []
    
    init(delegate: SearchViewModelDelegate) {
        self.delegate = delegate
    }
    
}

// MARK: - Public
extension SearchViewModel {
    func initialize() {
        cityArray = ["İzmir", "Adana", "İstanbul", "Hatay", "Mersin", "Antep", "Ankara", "Bursa", "Trabzon"]
        filterCities()
    }
    
    func updateCities(with keyword: String) {
        searchKeyword = keyword
        filterCities()
    }
}

// MARK: - Search
extension SearchViewModel {
    private func filterCities() {
        if searchKeyword.count == 0 {
            filteredCityArray = cityArray
        } else {
            filteredCityArray = cityArray.filter({ str -> Bool in
                return str.lowercased().contains(searchKeyword.lowercased())
            })
        }
       
        self.delegate?.searchViewModelShouldUpdateTableView()
        self.delegate?.searchViewModelUpdateVisibilityOfTable(isShowing: filteredCityArray.count > 0)
    }
}
