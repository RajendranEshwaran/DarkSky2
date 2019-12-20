//
//  WeatherModel.swift
//  DarkSky2
//
//  Created by gomathi saminathan on 12/19/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import Foundation

struct WeatherModel {
    var summary:String
    var icon:String
    var tempra:Double

    enum SerializationError:Error {
        case missing(String)
        case invalid(String,Any)
    }
    
    init(json:[String:Any]) throws {
        
        guard let summry = json["summary"] as? String else { throw SerializationError.missing("") }
        
        guard let icn = json["icon"] as? String else {
            throw SerializationError.missing("icon missing")
        }
        
        guard let temp = json["temperatureMax"] as? Double else {
            throw SerializationError.missing("Temprature missing")
        }
        self.summary = summry
        self.icon = icn
        self.tempra = temp
        
    }
}
