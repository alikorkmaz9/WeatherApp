//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Ali Korkmaz on 27.06.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblNoResult: UILabel!
    
    private let searchController = UISearchController()
    
    private var viewModel: SearchViewModel!
}

// MARK: - Lifecycle
extension SearchViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SearchViewModel(delegate: self)
        setUpUI()
        viewModel.initialize()
    }
}

// MARK: - Search View Model delegate
extension SearchViewController: SearchViewModelDelegate {
    func searchViewModelShouldUpdateTableView() {
        tableView.reloadData()
    }
    
    func searchViewModelUpdateVisibilityOfTable(isShowing: Bool) {
        tableView.alpha = isShowing ? 1.0 : 0
        lblNoResult.alpha = isShowing ? 0 : 1.0
    }
}

// MARK: - Set Up UI
extension SearchViewController {
    private func setUpUI() {
        self.navigationItem.title = "Search"
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        tableView.dataSource = self
        tableView.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        tableView.isUserInteractionEnabled = true
        tableView.tableFooterView = UIView(frame: .zero)
    }
}

//MARK: -TableView
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredCityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currentCity = viewModel.filteredCityArray[indexPath.row]
        cell.textLabel?.text = currentCity
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForecastViewController") as! ForecastViewController
        viewController.city = viewModel.filteredCityArray[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: -SearchBarDelegate
extension SearchViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        viewModel.updateCities(with: searchText)
    }
    
}
