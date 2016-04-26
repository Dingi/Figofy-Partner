//
//  DBPaymentRegister.swift
//  Figofy
//
//  Created by Janus Ringling on 19/04/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import Foundation

class Payment{
    
    private var _paymentPostKey: String!
    private var _amount: Int!
    private var _seas: String!
    private var _user: String!
    private var _boughtTimeStart: String!
    private var _boughtTimeEnd: String!
    private var _orderId: String!
    private var _transaktionId: String!
    
    var amount: Int {
        get{
            return _amount!
        }
        
    }
    
    var seas: String {
        get{
            return _seas!
        }
        
    }
    
    var user: String {
        get{
            return _user!
        }
        
    }
    
    var boughtTimeStart: String {
        get{
            return _boughtTimeStart!
        }
        
    }
    var boughtTimeEnd: String {
        get{
            return _boughtTimeEnd
        }
        
    }
    
    var orderId: String {
        get{
            return _orderId!
        }
        
    }
    
    var transactionId: String {
        get{
            return _transaktionId!
        }
        
    }
    
    init (postKey: String, dictionary: Dictionary<String, AnyObject>){
        self._paymentPostKey = postKey
        
        if let amount = dictionary["amount"] as? Int{
            self._amount = amount
        }
        if let seas = dictionary["seas"] as? String{
            self._seas = seas
        }
        if let user = dictionary["user"] as? String{
            self._user = user
        }
        if let boughtTimeStart = dictionary["bought_time_start"] as? String{
            self._boughtTimeStart = boughtTimeStart
        }
        if let boughtTimeEnd = dictionary["bought_time_end"] as? String{
            self._boughtTimeEnd = boughtTimeEnd
        }
        if let orderId = dictionary["order_id"] as? String{
            self._orderId = orderId
        }
        if let transactionId = dictionary["transaction_id"] as? String{
            self._transaktionId = transactionId
        }
        
        
    }
    
    
    
}
