//
//  ViewController.swift
//  DarkSky2
//
//  Created by gomathi saminathan on 12/19/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var weathermodel = [WeatherModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        WeatherFetch.weatherFethData(withLocation: "37.8267,-122.4233")  {(result:[WeatherModel]) in
        
            for result in result{
                //print(result.tempra)
                
                self.weathermodel.append(result)
                print(self.weathermodel)
            }
        }
    }


}

