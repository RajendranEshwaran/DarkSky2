//
//  WeatherFetch.swift
//  DarkSky2
//
//  Created by gomathi saminathan on 12/19/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import Foundation

class WeatherFetch{
    
    static let baseurl = "https://api.darksky.net/forecast/8b9d50ba3d44a7d54d8aa6c084e76957/"
    
    static func weatherFethData(withLocation location:String, completion:@escaping([WeatherModel]) ->())
    {
        let url = baseurl + location
        print(url)
        let request = URLRequest(url:URL(string: url)!)
        let dataTask = URLSession.shared.dataTask(with: request) { (data:Data?,response:URLResponse?,error:Error?) in
        
            var forecastArray = [WeatherModel]()
            if let data = data{
                
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
                    {
                        if let dailyForecast = json["daily"] as? [String:Any]
                        {
                            if let dailyData = dailyForecast["data"] as? [[String:Any]]
                            {
                                for data in dailyData
                                {
                                    if let weatherObj = try? WeatherModel(json: data)
                                    {
                                        forecastArray.append(weatherObj)
                                    }
                                }
                            }
                        }
                    }
                }
                catch{
                    
                }
                completion(forecastArray)
            }
            
        }
        dataTask.resume()
        
    }
}
