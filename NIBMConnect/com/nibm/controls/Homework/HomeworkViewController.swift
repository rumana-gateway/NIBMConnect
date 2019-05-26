//
//  HomeworkViewController.swift
//  NIBMConnect
//
//  Created by R F on 5/20/19.
//  Copyright © 2019 Rumana Fazani-COBSCComp171p-007. All rights reserved.
//

import UIKit

class HomeworkViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
 
    @IBOutlet weak var homeWorkList: UITableView!
    var homeWorkArray:[HomeWork] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.homeWorkList.delegate = self
        self.homeWorkList.dataSource = self
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.homeWorkList.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let arrayDetails = HomeWork.getHomeWork() {
            homeWorkArray = arrayDetails
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeWorkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let home = homeWorkArray[indexPath.row]
        
        let cell:HomeWorkCell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeWorkCell
        
        cell.setupCell(title: home.title, des: home.description)
        
        return cell
    }
}


