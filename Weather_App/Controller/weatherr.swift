//
//  weatherr.swift
//  Weather_App
//
//  Created by Jaskirat Mangat on 2021-06-22.
//

import Foundation
import CoreLocation

protocol weatherrDelegate {
    func didUpdateweather(weather: weatherModel)
}




struct weatherr{
   
    
    
   
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d736151b2ebeb918e295f307a96b44bb&units=metric"
    
 var delegate: weatherrDelegate?
    
   
    func fetchweather(cityName: String){
        
        
        
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(cityName)
        self.performRequest(urlString: urlString)
    }
    
    
    func fetchweather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        
     let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        self.performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        
        

        if let url = URL(string: urlString){
            
            
            let session = URLSession(configuration: .default)
            
          
            let task = session.dataTask(with: url) {(data,response,error) in
                if error != nil{
                    
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    
                    
                 
                    if let weather = self.parseJSON(weatherData: safeData){
                        
                        
                       
                        self.delegate?.didUpdateweather(weather: weather)
                        
                    }
                    
                    
                    
                    
                    
                    
                }
            }
            
            
            task.resume()
        }
        
        
        
        
        
        
        
        
    }
    
    
    
    
    func parseJSON(weatherData: Data) -> weatherModel?{
        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let temp = decodedData.main.temp
            let humidity = decodedData.main.humidity
            let temp_min = decodedData.main.temp_min
            let temp_max = decodedData.main.temp_max
            let speed = decodedData.wind.speed
            let gust = decodedData.wind.gust
            let deg = decodedData.wind.deg
            let name = decodedData.name
            let id = decodedData.weather[0].id
            let weather = weatherModel(conditionId: id, cityName: name, temperature: temp,
                                       temperature_min:temp_min,
            temperature_max: temp_max,
            hum: humidity,
            windSpeed: speed,
            
            
            windGust: gust,
            windDirection: deg)
         
           
            return weather
            
        } catch{
            
            
            print(error)
            return nil
        }
        
      
    }
    
   
    
}
