//
//  AddHomeWorkViewController.swift
//  NIBMConnect
//
//  Created by R F on 5/26/19.
//  Copyright © 2019 Rumana Fazani-COBSCComp171p-007. All rights reserved.
//

import UIKit

class AddHomeWorkViewController: UIViewController {
    @IBOutlet weak var titleTextF: UITextField!
    
    @IBOutlet weak var desTextf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addHomeWork(_ sender: Any) {
        
        let newHomeWork = HomeWork(titl: titleTextF.text!, des: desTextf.text!)
        HomeWork.saveHomeWork(homeWork: newHomeWork)
        
    }
    
    @IBAction func dismiss(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
