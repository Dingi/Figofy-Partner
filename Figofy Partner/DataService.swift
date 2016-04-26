//
//  DataService.swift
//  Figofy Partner
//
//  Created by Tommy on 26/04/2016.
//  Copyright © 2016 Figofy. All rights reserved.
//

import Foundation
import Firebase

let URL_BASE = "https://figofydatabase.firebaseio.com"

class DataService {
    static let dataService = DataService()
    
    // MARK: Variables
    private var _REF_BASE = Firebase(url: "\(URL_BASE)")
    private var _REF_SEAS = Firebase(url: "\(URL_BASE)/seas")
    private var _REF_USERS = Firebase(url: "\(URL_BASE)/users")
    private var _REF_FISH = Firebase(url: "\(URL_BASE)/fish")
    private var _REF_PARTNER = Firebase(url: "\(URL_BASE)/partners")
    private var _REF_PAYMENT_REGISTER = Firebase(url: "\(URL_BASE)/payment")
    private var _CURRENT_TIMESTAMP = FirebaseServerValue.timestamp()
    
    // MARK: Properties
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
    var REF_SEAS: Firebase {
        return _REF_SEAS
    }
    
    var REF_USERS: Firebase {
        return _REF_USERS
    }
    
    var REF_PAYMENT_REGISTER: Firebase{
        return _REF_PAYMENT_REGISTER
    }
    var REF_PARTNER: Firebase{
        return _REF_PARTNER
    }
    
    var REF_USER_CURRENT: Firebase {
        let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) as! String
        //same as doing /users after the URL_BASE
        let user = Firebase(url: "\(URL_BASE)").childByAppendingPath("users").childByAppendingPath(uid)
        return user
    }
    
    var REF_FISH: Firebase {
        return _REF_FISH
    }
    
    
    
}