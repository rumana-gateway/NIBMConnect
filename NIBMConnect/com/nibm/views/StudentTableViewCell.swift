//
//  StudentTableViewCell.swift
//  NIBMConnect
//
//  Created by R F on 5/26/19.
//  Copyright © 2019 Rumana Fazani-COBSCComp171p-007. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var fbLink: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var firstName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(friend: Friends){
        firstName.text = friend.firstName
        fbLink.text = friend.lastName
        fbLink.text = friend.city
    }

    
}
