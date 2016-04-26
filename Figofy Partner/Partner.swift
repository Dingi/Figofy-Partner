//
//  Partner.swift
//  Figofy Partner
//
//  Created by Janus Ringling on 26/04/2016.
//  Copyright © 2016 Figofy. All rights reserved.
//

import Foundation

class Partner{
    
    static var staticPartner = Partner()
    
    private var _postKey: String!
    private var _id: String!
    private var _seaId: String!
    private var _name: String!
    
    var postKey: String{
        return _postKey
        
    }
    var id: String{
        get{return _id}
        set{_id = newValue}
    }
    var seaId: String{
        get{return _seaId}
    }
    var name: String{
        return _name
    }
    
    init(id: String){
        self._id = id
    
    }
    
    init(){
    
    }
    
    init(postKey:String, dictionary: Dictionary<String, AnyObject>){
        self._postKey = postKey
        
        if let id = dictionary["id"] as? String{
            self._id = id
        }
        if let seaId = dictionary["sea_id"] as? String{
            self._seaId = seaId
        }
        if let name = dictionary["name"] as? String{
            self._name = name
        }
        
        
    }

}