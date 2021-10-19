//
//  LeadManager.swift
//  MapSpike
//
//  Created by Zachary Buffington on 10/18/21.
//

import Foundation
import CoreLocation


class LeadManager {
    
    var leads: [Lead] = []
    
    func createNewLead(lon: Double, lat: Double) {
        let newLead = Lead(lon: lon, lat: lat)
        leads.append(newLead)
    }
    
    
    
    
}
