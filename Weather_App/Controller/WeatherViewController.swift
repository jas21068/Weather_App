//
//  ViewController.swift
//  Weather_App
//
//  Created by Jaskirat Mangat on 2021-06-22.
//

import UIKit
import CoreLocation
class WeatherViewController: UIViewController, UITextFieldDelegate,weatherrDelegate {

    @IBOutlet weak var d: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var MinMaxTemp: UILabel!
    @IBOutlet weak var HUMIDITY: UILabel!
    @IBOutlet weak var WINDspeed: UIStackView!
    @IBOutlet weak var windSPEED: UILabel!
    @IBOutlet weak var windGUST: UILabel!
    @IBOutlet weak var windDIRECTION: UILabel!
    var Weatherr = weatherr()
    let locationManager = CLLocationManager()
    let date = Date()
    let calendar = Calendar.current
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        Weatherr.delegate = self
        searchTextField.delegate = self
        
        let day = calendar.component(.day, from: date)
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        
        self.d.text = String(day) + "/" + String(month) + "/" + String(year)
    }
    
    
    @IBAction func locationPressed(_ sender: UIButton) {
        
       
    }
    
    

    @IBAction func searchPressed(_ sender: UIButton) {
        
       print(searchTextField.text!)
        searchTextField.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { print(searchTextField.text!)
                 searchTextField.endEditing(true)
       
        return true

    }
    func textFieldDidEndEditing(_ textField: UITextField)  {
        
        
        
        
        if let city = searchTextField.text{
            
            Weatherr.fetchweather(cityName: city)
        }
        searchTextField.text = ""
    }
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
            
        }
        else{
            textField.placeholder = "Type Smething"
            return false
                                                          
        }
    }
    
    
    func didUpdateweather(weather: weatherModel){
        
        
        print(weather.temperatureString)
        print(weather.ConditionName)
        print(weather.hum)
        print(weather.temperature_min)
        print(weather.temperature_max)
        print(weather.windGust)
        print(weather.windSpeed)
        print(weather.windDirection)
        
        let tempmin: String = String(format: "%.1f", weather.temperature_min)
        let tempmax: String = String(format: "%.1f", weather.temperature_max)
        let humidity: String = String(format: "%.1f", weather.hum)
        let windspeed: String = String(format: "%.1f", weather.windSpeed)
        let windgust: String = String(format: "%.1f", weather.windGust)
        let winddirection: String = String(format: "%.1f", weather.windDirection)
        DispatchQueue.main.async{
            self.temperatureLabel.text = weather.temperatureString + "°C"
            self.conditionImageView.image = UIImage(systemName: weather.ConditionName)
            self.cityLabel.text = weather.cityName
            self.MinMaxTemp.text = tempmax + "°C / " + tempmin + "°C"
            
            self.HUMIDITY.text = humidity + "%"
            self.windSPEED.text = windspeed
            self.windGUST.text = windgust
            self.windDIRECTION.text = winddirection + "°"
            
        }
        
        
    }
    
    
  
    
}
//ebeb918e295f307a96b44bb
//MARK: -






extension WeatherViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            
            let Lat = location.coordinate.latitude
            let Lon = location.coordinate.longitude
            print(Lat)
            print(Lon)
            Weatherr.fetchweather(latitude: Lat, longitude: Lon )
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
}
