//
//  LandingViewController.swift
//  NIBMConnect
//
//  Created by R F on 5/20/19.
//  Copyright © 2019 Rumana Fazani-COBSCComp171p-007. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LandingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        AppTempData.userHandle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                self.performSegue(withIdentifier: "showLogin", sender: nil)
            } else {
                //                self.performSegue(withIdentifier: "showHome", sender: nil)
                self.performSegue(withIdentifier: "showHome", sender: nil)
            }
        }
        
        func viewWillAppear(_ animated: Bool) {
            AppTempData.userHandle = Auth.auth().addStateDidChangeListener { (auth, user) in
                // ...
                
            }
        }

    }
}
