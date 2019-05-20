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
                self.performSegue(withIdentifier: "showLogin", sender: nil)
            }
        }
        
        func viewWillAppear(_ animated: Bool) {
            AppTempData.userHandle = Auth.auth().addStateDidChangeListener { (auth, user) in
                // ...
                
            }
        }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
