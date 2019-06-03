//
//  HomeViewController.swift
//  NIBMConnect
//
//  Created by R F on 5/20/19.
//  Copyright © 2019 Rumana Fazani-COBSCComp171p-007. All rights reserved.
//

import UIKit
import LocalAuthentication
import FirebaseAuth

class HomeViewController: UIViewController {

    @IBOutlet weak var myProfile: UIButton!
    @IBOutlet weak var btnFrnds: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func showMyProfile(_ sender: Any) {
        authenticateUser()
    }
    
    @IBAction func signOt(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        performSegue(withIdentifier: "showLogin", sender: nil)
    }    
    @IBAction func btnFrnds(_ sender: Any) {
        self.performSegue(withIdentifier: "showStudents", sender: nil)
    }
    
    func authenticateUser() {
        let myContext = LAContext()
        let myLocalizedReasonString = "NiBM Connect"
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                    DispatchQueue.main.async {
                        if success {
                            // User authenticated successfully, take appropriate action
                            self.performSegue(withIdentifier: "showMyprofile", sender: nil)
                            
                        } else {
                            
                            print(evaluateError?.localizedDescription)
                        }
                    }
                }
            } else {
                print("Sorry!!.. Could not evaluate policy.")
            }
        } else {
            print("Sorry!!.. Could not evaluate policy.")
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
