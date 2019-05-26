//
//  DetailViewController.swift
//  NIBMConnect
//
//  Created by R F on 5/26/19.
//  Copyright © 2019 Rumana Fazani-COBSCComp171p-007. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fName: UILabel!
    @IBOutlet weak var fbLink: UILabel!
    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var birth: UILabel!
    @IBOutlet weak var city: UILabel!
    
    var friendObject:Friends! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fName.text = friendObject.firstName
        lName.text = friendObject.lastName
        phone.text = friendObject.phoneNum
        city.text = friendObject.city
        birth.text = friendObject.birthDay
        fbLink.text = friendObject.fbLink
        let url = URL(string: friendObject!.pf)
        profileImage.kf.setImage(with: url)
    
    }

}
