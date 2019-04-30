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
    var tripTitle = ""
    var tripModel: TripModel?
    var headerInSection: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = tripTitle
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
            self.backgroundImage.image = model.image
            self.tableView.reloadData()
        }
        headerInSection = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell")?.contentView.bounds.height ?? 0
    }
    
    @IBAction func backToTripsViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension ActivitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerInSection
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as! HeaderTableViewCell
        if let dayModel = tripModel?.dayModels[section] {
            cell.setup(model: dayModel)
        }
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivityTableViewCell.identifier) as! ActivityTableViewCell
        if let model = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row] {
            cell.setup(model: model)
        }
        return cell
    }
}
