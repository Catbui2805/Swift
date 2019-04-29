//
//  TripsTableViewCell.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/29/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = CGSize.zero
        cardView.layer.cornerRadius = 10
        cardView.layer.shadowColor = UIColor.darkGray.cgColor
        
    }
    
    func setup(tripModel: TripModel){
        titleLabel.text = tripModel.title
    }

}
