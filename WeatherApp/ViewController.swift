//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ali Korkmaz on 24.06.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var table: UITableView!
    
    private let viewModel = ForecastViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(DailyDataTableViewCell.nib(), forCellReuseIdentifier: DailyDataTableViewCell.identifier)
        table.dataSource = self
        table.delegate = self
        
        viewModel.delegate = self 
        viewModel.requestForecastModel()
        // Do any additional setup after loading the view.
    }

}

//MARK: -TableView
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dailyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyDataTableViewCell", for: indexPath) as! DailyDataTableViewCell
        cell.update(with: viewModel.dailyArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}


//MARK: -ViewModelDelegate
extension ViewController: ForecastViewModelDelegate {
    func forecastViewModelDidGetData() {
        print(viewModel.dailyArray)
        self.table.reloadData()
    }
}



