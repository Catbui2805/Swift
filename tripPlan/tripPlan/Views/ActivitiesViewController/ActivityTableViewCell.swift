//
//  ActivityTableViewCell.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/30/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imagePhoto: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.addShadowAndRoundedCorner()
        cardView.layer.backgroundColor = Theme.accentColor.cgColor
        
        titleLabel.font = UIFont(name: Theme.bodyFontNameDemiBold, size: 15)
        subTitleLabel.font = UIFont(name: Theme.bodyFontName, size: 15)
        
    }
    
    func setup(model: ActivityModel) {
        titleLabel.text = model.title
        subTitleLabel.text = model.subTitle
        imagePhoto.image = getActivityImageView(type: model.activityType)
    }
    
    func getActivityImageView(type: ActivityType) -> UIImage?{
        switch type {
        case .auto:
            return UIImage(named: "Car")
        case .excursion:
            return UIImage(named: "Excursion")
        case .flight:
            return UIImage(named: "Flight")
        case .food:
            return UIImage(named: "Food")
        case .hotel:
            return UIImage(named: "Hotel")
        }
    }
}
