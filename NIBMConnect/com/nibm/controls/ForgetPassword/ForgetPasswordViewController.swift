//
//  ForgetPasswordViewController.swift
//  NIBMConnect
//
//  Created by R F on 5/20/19.
//  Copyright © 2019 Rumana Fazani-COBSCComp171p-007. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ForgotPassword: UIViewController {
    
    @IBOutlet weak var emailTxtF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func getPassword(_ sender: Any) {

        if emailTxtF.text!.isEmpty {
            print("please enter a email")
            return
        }else {

            Auth.auth().sendPasswordReset(withEmail: emailTxtF.text!) { (error) in
                if (error != nil){
                    print(error?.localizedDescription)

                }else{
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
}
