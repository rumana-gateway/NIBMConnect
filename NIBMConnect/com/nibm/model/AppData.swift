//
//  AppData.swift
//  NIBMConnect
//
//  Created by R F on 5/21/19.
//  Copyright © 2019 Rumana Fazani-COBSCComp171p-007. All rights reserved.
//

import Foundation

class AppData {
    
    static let defaults = UserDefaults.standard
    let defaults = UserDefaults.standard
    
    static func storeData ( data: String?, key: UserData!){
        defaults.setValue(data, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    static func getData (key: UserData!) -> String {
        if let userData = defaults.string(forKey: key.rawValue){
            return userData
        } else
        {
            return "Key Not Found!!!"
        }
    }
    
}

enum UserData: String{
    case username = "USERNAME"
    case userID = "USERID"
}
