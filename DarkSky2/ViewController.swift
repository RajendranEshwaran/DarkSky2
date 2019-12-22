//
//  ViewController.swift
//  DarkSky2
//
//  Created by gomathi saminathan on 12/19/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    

    @IBOutlet weak var dayWeatherTableView: UITableView!
    var weathermodel = [WeatherModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dayWeatherTableView.delegate = self
        
        WeatherFetch.weatherFethData(withLocation: "37.8267,-122.4233")  {(result:[WeatherModel]) in
        
            for result in result{
                
                self.weathermodel.append(result)
                DispatchQueue.main.async {
                    self.dayWeatherTableView.reloadData()
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathermodel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayWeatherCell", for: indexPath)
        let data = weathermodel[indexPath.row]
        
        cell.textLabel?.text = " Day:  \(String (data.tempra))"
        
        return cell
    }
    

}

