//
//  UserCell.swift
//  tableTest
//
//  Created by APPLE on 11/28/20.
//  Copyright © 2020 SafeWalk. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet var mylabel : UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
