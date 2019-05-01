//
//  AddTripViewController.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/29/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//
import Photos
import UIKit

class AddTripViewController: UIViewController {
    
    @IBOutlet weak var cameraBt: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addTripTextField: UITextField!
    @IBOutlet weak var cancelBt: UIButton!
    @IBOutlet weak var saveBt: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var doneSaving: (() -> ())?
    var tripIndexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 10
        cameraBt.layer.cornerRadius = 10
        cameraBt.tintColor = Theme.tintColor
        // dropshadow on title
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 5
        
        if let index = tripIndexToEdit {
            let trip = Data.tripModels[index]
            addTripTextField.text = trip.title
            imageView.image = trip.image
            titleLabel.text = "Edit Trip"
        }
        
    }
    
    @IBAction func cancelTaped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: Any) {

        guard addTripTextField.hasValue, let newTripName = addTripTextField.text else {
            return
        }
        
        if let index = tripIndexToEdit {
            TripFuctions.updateTrip(at: index, title: newTripName, image: imageView.image)
        } else {
            TripFuctions.createTrip(tripModel: TripModel(title: newTripName, image: imageView.image))
        }
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    fileprivate func presentPhotoPickerController() {
        let myPickerController = UIImagePickerController()
        myPickerController.allowsEditing = true
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
                self.presentPhotoPickerController()
                
            case .notDetermined:
                if status == PHAuthorizationStatus.authorized {
                    self.presentPhotoPickerController()
                }
            case .restricted:
                let alert = UIAlertController(title: "Photo Library Restricted", message: "PhotoLibrary access is restricted and cannot be accessed.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            case .denied:
                let alert = UIAlertController(title: "Photo Library Access Denied", message: "PhotoLibrary access was previously deneid. Please update your Settings if you wish to change this.", preferredStyle: .alert)
                let goToSettingsAction = UIAlertAction(title: "Go to Settings", style: .default) { (action) in
                    DispatchQueue.main.async {
                        let url = URL(string: UIApplication.openSettingsURLString)!
                        UIApplication.shared.open(url, options: [:])
                    }
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                
                alert.addAction(goToSettingsAction)
                alert.addAction(cancelAction)
                self.present(alert, animated: true)
            default:
                break
            }
        }
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageView.image = image
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = image
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
