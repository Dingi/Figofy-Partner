//
//  User.swift
//  Figofy Partner
//
//  Created by Tommy on 27/04/2016.
//  Copyright © 2016 Figofy. All rights reserved.
//


import Foundation
import Firebase



class User {
    
    
    // MARK: Variables
    private var _firstName: String!
    private var _lastName: String!

    
    var userFirstName: String {
        return _firstName
    }
  
    
    var userLastName: String {
        return _lastName
    }
    

    
    
    init(facebookId: String, firstname: String, lastname: String, gender: String, birthday: String) {
       
        self._firstName = firstname
        self._lastName = lastname
       
    }
    
    
    init(postKey: String, dictionary: Dictionary<String, AnyObject>) {
        
        if let fName = dictionary["first_name"] as? String {
            print("firstName: \(fName)")
            self._firstName = fName
        }
        
        if let fLast = dictionary["last_name"] as? String {
            print("lastName: \(fLast)")
            self._lastName = fLast
        }
        
        
        
    }
    

    
    
    
    
}