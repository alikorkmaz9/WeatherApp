//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ali Korkmaz on 24.06.2021.
//

import UIKit

class ViewController: UIViewController {
    private let viewModel = ForecastViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.requestForecastModel()
        // Do any additional setup after loading the view.
    }


}

