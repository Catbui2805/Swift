//
//  ActivitiesViewController.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/30/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImage: UIImageView!
    var tripId: UUID!
    var tripModel: TripModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        TripFuctions.readTrip(by: tripId) { [weak self] (model) in
            guard let self = self else {
                return
            }
            self.tripModel = model
            guard let model = model else {
                return
            }
            self.title = model.title
            self.backgroundImage.image = model.image
            self.tableView.reloadData()
        }
        
    }
    
    @IBAction func backToTripsViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension ActivitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = tripModel?.dayModels[section].title ?? ""
        let subtitle = tripModel?.dayModels[section].subtitle ?? ""
        
        return "\(title) - \(subtitle)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row].title
        return cell
    }
}
