//
//  TripsTableViewCell.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/29/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.addShadowAndRoundedCorner()
        tripImageView.layer.cornerRadius = cardView.layer.cornerRadius
    }
    
    func setup(tripModel: TripModel){
        titleLabel.text = tripModel.title
        
        if let tripImage = tripModel.image {
            tripImageView.alpha = 0.3
            tripImageView.image = tripImage
            
            UIView.animate(withDuration: 1) {
                self.tripImageView.alpha = 1
            }
        }
    }

}
