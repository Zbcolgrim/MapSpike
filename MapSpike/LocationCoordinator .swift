//
//  LocationCoordinator .swift
//  MapSpike
//
//  Created by Zachary Buffington on 10/18/21.
//

import Foundation
import CoreLocation

class LocationCoordinator: NSObject, CLLocationManagerDelegate {
    
    
    let manager = CLLocationManager()
    var currentLocation: CLLocation?
    override init() {
        super.init()
        
        manager.delegate = self
        // switch = if statement with certain amount of possibilities 
        switch manager.authorizationStatus {
            
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted:
            manager.requestWhenInUseAuthorization()
    
        case .denied:
            break
        case .authorizedAlways:
            manager.startUpdatingLocation()
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.last
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // || = means or
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            manager.startUpdatingLocation() 
        }
    }
}
