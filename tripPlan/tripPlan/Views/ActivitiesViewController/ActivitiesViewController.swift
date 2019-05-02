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
    @IBOutlet weak var addButton: AppUIButton!
    
    var tripId: UUID!
    var tripTitle = ""
    var tripModel: TripModel?
    var headerInSection: CGFloat = 0.0
    
    fileprivate func updateTableViewWithTripDate() {
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = tripTitle
        addButton.createFloatingActionButton()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        updateTableViewWithTripDate()
        
        headerInSection = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell")?.contentView.bounds.height ?? 0
    }
    
    
    @IBAction func toggleEditMode(_ sender: UIBarButtonItem) {
//        tableView.isEditing = !tableView.isEditing
        tableView.isEditing.toggle()
        sender.title = sender.title == "Edit" ? "Done" : "Edit"
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Which would you like to add?", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        let dayAction = UIAlertAction(title: "Day", style: UIAlertAction.Style.default, handler: handleAddDay)
        let activityAction = UIAlertAction(title: "Activity", style: UIAlertAction.Style.default, handler: { (action) in
            self.handleAddActivity(action: action)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (action) in
            print("Cancel")
        })
        
//        if tripModel?.dayModels.count == 0 {
//            activityAction.isEnabled = false
//        }

        activityAction.isEnabled = tripModel!.dayModels.count > 0
        
        alert.addAction(dayAction)
        alert.addAction(activityAction)
        alert.addAction(cancelAction)
        alert.view.tintColor = Theme.tintColor
        alert.popoverPresentationController?.sourceView = sender
        alert.popoverPresentationController?.sourceRect = sender.bounds
        present(alert, animated: true)
    }
    
    func handleAddActivity(action: UIAlertAction) {
        let vc = AddActivityViewController.getInstance() as! AddActivityViewController
        vc.tripModel = tripModel
        vc.tripIndex = getTripIndex()
        vc.doneSaving = { [weak self] (dayIndex,activityModel) in
            guard let self = self else {
                return
            }
            self.tripModel?.dayModels[dayIndex].activityModels.append(activityModel)
            let row = (self.tripModel?.dayModels[dayIndex].activityModels.count)! - 1
            let indexPath = IndexPath(row: row, section: dayIndex)
            self.tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
        
        present(vc, animated: true)
    }
    
    fileprivate func getTripIndex() -> Int? {
        return Data.tripModels.firstIndex(where: { (tripModel) -> Bool in
            tripModel.id == tripId
        })
    }
    
    func handleAddDay(action: UIAlertAction) {
        let vc = AddDayViewController.getInstance() as! AddDayViewController
        vc.tripModel = tripModel
        vc.tripIndex = getTripIndex()
        vc.doneSaving = { [weak self] (dayModel) in
            guard let self = self else {
                return
            }
            self.tripModel?.dayModels.append(dayModel)
            let indexArray = [self.tripModel?.dayModels.firstIndex(of: dayModel) ?? 0]
            self.tableView.insertSections(IndexSet(indexArray), with: UITableView.RowAnimation.automatic)
        }
        present(vc, animated: true)
    }
    
    @IBAction func backToTripsViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let activityModel = tripModel!.dayModels[indexPath.section].activityModels[indexPath.row]
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) ->()) in
            
            let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete this activity: \(activityModel.title)?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alerAction) in
                actionPerformed(false)
            }))
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alerAction) in
                //Perform delete
                ActivityFunctions.deleteActivity(at: self.getTripIndex()!, for: indexPath.section, using: activityModel)
                self.tripModel!.dayModels[indexPath.section].activityModels.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
            self.present(alert, animated: true)
        }
        delete.image = UIImage(named: "clear2")
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
 
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: (Bool) -> Void) in
            let vc = AddActivityViewController.getInstance() as! AddActivityViewController
            vc.tripModel = self.tripModel
            
            //  which trip are we working with?
            vc.tripIndex = self.getTripIndex()
            
            // which day are we on?
            vc.dayIndexToEdit = indexPath.section
            
            // which activity are we editing?
            vc.activityModelToEdit = self.tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
            
            // what do we whant to happen after the activity is saved?
            vc.doneUpdating = { [weak self] (oldDayIndex, newDayIndex, activityModel) in
                guard let self = self else {
                    return
                }
                let oldActivityIndex = (self.tripModel?.dayModels[oldDayIndex].activityModels.firstIndex(of: activityModel))!
                
                if oldDayIndex == newDayIndex {
                    // 1. Update the local table data
                    self.tripModel?.dayModels[newDayIndex].activityModels[oldActivityIndex] = activityModel
                    // 2. Refresh just that row
                    let indexPath = IndexPath(row: oldActivityIndex, section: newDayIndex)
                    tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                } else {
                    // Activity moved to a different day
                    
                    // 1. Remove activity form local table data
                    self.tripModel?.dayModels[oldDayIndex].activityModels.remove(at: oldActivityIndex)
                    // 2. Insert activity into new location
                    let lastIndex = (self.tripModel?.dayModels[newDayIndex].activityModels.count)!
                    self.tripModel?.dayModels[newDayIndex].activityModels.insert(activityModel, at: lastIndex)
                    // 3. Update table rows
                    tableView.performBatchUpdates({
                        tableView.deleteRows(at: [indexPath], with: .automatic)
                        let insertIndexPath = IndexPath(row: lastIndex, section: newDayIndex)
                        tableView.insertRows(at: [insertIndexPath], with: .automatic)
                    })
                }
            }
            self.present(vc, animated: true)
            actionPerformed(true)
        }
        edit.image = UIImage(named: "edit")
        edit.backgroundColor = Theme.tableEditColor
        
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true 
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // 1. Get the current activity
        let activityModel = (tripModel?.dayModels[sourceIndexPath.section].activityModels[sourceIndexPath.row])!
        
        // 2. Delete activity form old location
        tripModel?.dayModels[sourceIndexPath.section].activityModels.remove(at: sourceIndexPath.row)
        
        // 3. Inset activity into the new location
        tripModel?.dayModels[destinationIndexPath.section].activityModels.insert(activityModel, at: destinationIndexPath.row)
    
        // 4. Update the data store
        ActivityFunctions.reorderActivity(at: getTripIndex()!, oldDayIndex: sourceIndexPath.section, newDayIndex: destinationIndexPath.section, newActivityIndex: destinationIndexPath.row, activityModel: activityModel)
        
    }
}
