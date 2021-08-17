//
//  WeatherModel.swift
//  Weather_App
//
//  Created by Jaskirat Mangat on 2021-06-22.
//

import Foundation
struct weatherModel{
    let conditionId: Int
       let cityName: String
       let temperature: Double
    let temperature_min: Double
    let temperature_max: Double
    let hum:Double
    let windSpeed:Double
    let windGust:Double
    let windDirection:Double
    
    
    var temperatureString: String{
           
           return String(format: "%.1f",temperature)
           
       }
    
    var temperatureString_max: String{
           
           return String(format: "%.1f",temperature_max)
           
       }
    
    var temperatureString_min: String{
           
           return String(format: "%.1f",temperature_min)
           
       }
       
    
    var ConditionName: String{
        switch conditionId {
        
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return"cloud.rain"
        case 600...622:
            return"cloud.snow"
        case 701...781:
            return"cloud.fog"
        case 800:
            return"sun.max"
        case 801...804:
            return"cloud"
           
        default:
            return "cloud"
        }
            
          }
    
    var speech: String{
    switch conditionId {
    
    case 200...232:
        return "STORM!!!"
    case 300...321:
        return "LIGHT RAIN"
    case 500...531:
        return"RAIN"
    case 600...622:
        return"snow"
    case 701...781:
        return"Hazzy"
    case 800:
        return"Clear Sky"
    case 801...804:
        return"Cloudy"
       
    default:
        return "cloud"
    }
        
      }
    
    
    
}
