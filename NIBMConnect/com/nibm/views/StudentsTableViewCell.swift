//
//  StudentsTableViewCell.swift
//  NIBMConnect
//
//  Created by R F on 5/23/19.
//  Copyright © 2019 Rumana Fazani-COBSCComp171p-007. All rights reserved.
//

import UIKit

class StudentsTableViewCell: UITableViewCell {

    @IBOutlet weak var fName: UILabel!
    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var profile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(friend: Friends){
        fName.text = friend.firstName
        lName.text = friend.lastName
       cityName.text = friend.city
    }

}
