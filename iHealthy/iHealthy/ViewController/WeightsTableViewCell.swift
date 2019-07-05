//
//  WeightsTableViewCell.swift
//  iHealthy
//
//  Created by Gerardo Ramos on 7/5/19.
//  Copyright © 2019 Gerardo Ramos. All rights reserved.
//

import UIKit

class WeightsTableViewCell: UITableViewCell {

    @IBOutlet weak var weightLabel: UIView!
    @IBOutlet weak var commentLabel: UIView!
    @IBOutlet weak var dateLabel: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
