//
//  IncedentCell.swift
//  Incedent Report
//
//  Created by Matthew Elmore on 11/5/19.
//  Copyright © 2019 Matthew Elmore. All rights reserved.
//

import UIKit

class IncedentCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
