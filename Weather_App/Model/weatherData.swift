//
//  weatherData.swift
//  Weather_App
//
//  Created by Jaskirat Mangat on 2021-06-22.
//

import Foundation

struct WeatherData: Codable{
    let name: String
    let main: Main
    let wind: Wind
    let weather: [Weather]
    
    
}
struct Main: Codable{
    
    
    let temp:Double
    let temp_min:Double
    let temp_max:Double
    let feels_like:Double
    let humidity:Double

}

struct Wind: Codable{
    
  
    let speed:Double
    let gust:Double
    let deg:Double
    
}

struct Weather: Codable{

    let id: Int

}



