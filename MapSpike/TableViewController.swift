//
//  TableViewController.swift
//  MapSpike
//
//  Created by Zachary Buffington on 10/18/21.
//

import UIKit

class TableViewController: UITableViewController {

    let manager = LeadManager()
    let coordinator = LocationCoordinator()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return manager.leads.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leadCell", for: indexPath)

        let lead = manager.leads[indexPath.row]
        cell.textLabel?.text = "\(lead.lat)"

        return cell
    }
    
    
    @IBAction func newLeadButtonTapped(_ sender: Any) {
        guard let location = coordinator.currentLocation else {return}
        manager.createNewLead(lon: location.coordinate.longitude, lat: location.coordinate.latitude)
        tableView.reloadData()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
    

}
