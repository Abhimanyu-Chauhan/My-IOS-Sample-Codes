//
//  PersonCell.swift
//  LocalJsonAndCoreData
//
//  Created by Abhimanyu Kumar Chauhan on 04/12/18.
//  Copyright © 2018 Abhimanyu Kumar Chauhan. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLabel: UILabel!    
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
