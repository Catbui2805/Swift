//
//  HeaderTableViewCell.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/30/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 17)
        subTitleLabel.font = UIFont(name: Theme.bodyFontName, size: 15)
    }
    
    func setup(model: DayModel) {
        titleLabel.text = model.title
        subTitleLabel.text = model.subtitle
    }

}
