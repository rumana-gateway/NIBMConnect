//
//  StudentsViewController.swift
//  NIBMConnect
//
//  Created by R F on 5/20/19.
//  Copyright © 2019 Rumana Fazani-COBSCComp171p-007. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import Kingfisher


class StudentsViewController: UIViewController {
    
    var ref: DatabaseReference!
    var friendList:[Friends] = []
    var passFriend:Friends? = nil
    
    @IBOutlet weak var friendsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        self.ref.child("students").observeSingleEvent(of: .value) { (snapshot) in
            //get user value
            
            // let value = snapshot.value as? NSDictionary
            var friends:[Friends] = []
            
            if snapshot.childrenCount > 0 {
                for friend in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let friendObject = friend.value as? [String:AnyObject]
                    let fri = Friends(id: friendObject!["id"] as! String, fName: friendObject!["fName"] as! String, lName: friendObject!["lName"] as! String, fBLink: friendObject!["fbLink"] as! String, ph: friendObject!["phone"] as! String, bir: friendObject!["birth"] as! String, pf: friendObject!["pf"] as! String, city: friendObject!["city"] as! String)
                    
                    friends.append(fri)
                }
            }
            self.friendList = friends
            self.friendsTable.reloadData()
        }
        self.friendsTable.delegate = self
        self.friendsTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}

extension StudentsViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentsTableViewCell",for:indexPath)  as! StudentsTableViewCell
       cell.set(friend: friendList[indexPath.row])
        let url = URL(string: self.friendList[indexPath.row].pf)
        cell.profile.kf.setImage(with: url)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        passFriend = friendList[indexPath.row]
        self.performSegue(withIdentifier: "studentProfile", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "studentProfile"{
            
            if let viewController = segue.destination as? DetailViewController {
                viewController.friendObject = passFriend
            }
        }
    }

    
}        // Do any additional setup after loading the view.


