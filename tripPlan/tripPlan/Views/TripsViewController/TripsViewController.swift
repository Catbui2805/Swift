//
//  TripsViewController.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/29/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {
    
    
    @IBOutlet weak var addButton: FloatingActionButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFuctions.readTrip { [weak self] in
            // completion
            self?.tableView.reloadData()
        }
    }
    
    // Reload tableView when add trip
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripViewController
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension TripsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trip = Data.tripModels[indexPath.row]
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) ->()) in
            
            let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete this trip: \(trip.title)?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alerAction) in
                actionPerformed(true)
            }))
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alerAction) in
                //Perform delete
                TripFuctions.deleteTrip(index: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
            self.present(alert, animated: true)
        }
        delete.image = UIImage(named: "clear2")
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    
}
