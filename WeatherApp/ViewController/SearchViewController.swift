//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Ali Korkmaz on 27.06.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var searchText = ""
    
    var cityArray = ["İzmir", "Adana", "İstanbul", "Hatay", "Mersin", "Antep", "Ankara", "Bursa", "Trabzon"]
    var searchCity = [String]()
    let searchController = UISearchController()
    var searching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Search"
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        tableView.dataSource = self
        tableView.delegate = self
        updateSearchResults(for: searchController)
        searchController.dimsBackgroundDuringPresentation = false
        tableView.isUserInteractionEnabled = true
    }
    
}

//MARK: -TableView
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchCity.count
        } else {
        return cityArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        if searching {
            cell.textLabel?.text = searchCity[indexPath.row]
        } else {
            cell.textLabel?.text = cityArray[indexPath.row]
        }
        cell.isUserInteractionEnabled = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        print("aaa")
        viewController.city = cityArray[indexPath.row]
    }
}

//MARK: -SearchBarDelegate
extension SearchViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
                    return
                }
        searchCity = cityArray.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        tableView.reloadData()
    }
    
    
}
