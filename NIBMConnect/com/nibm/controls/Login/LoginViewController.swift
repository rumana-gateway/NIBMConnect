//
//  LoginViewController.swift
//  NIBMConnect
//
//  Created by R F on 5/20/19.
//  Copyright © 2019 Rumana Fazani-COBSCComp171p-007. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn


class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    
        // Do any additional setup after loading the view.
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            // ...
            print(error)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        // ...
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                // ...
                print(error)
                let alert = UIAlertController(title: "Login Error!", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            self.dismiss(animated: true, completion: nil)
            print(authResult!.user.email!)
            print(authResult!.user.displayName as Any)
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
