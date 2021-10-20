//
//  DetailViewController.swift
//  MapSpike
//
//  Created by Zachary Buffington on 10/18/21.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    var lead: Lead?
    
    // let coordinator = LocationCoordinator()
    
    @IBOutlet weak var locationMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let latitude = lead?.lat,
              let longitude = lead?.lon else {return}
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "lead"
        locationMapView.addAnnotation(annotation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        locationMapView.setRegion(region, animated: true)
        locationMapView.regionThatFits(region)
        
    }
    
    
    
    
}
