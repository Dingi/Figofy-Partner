//
//  PaymentsVC.swift
//  Figofy Partner
//
//  Created by Janus Ringling on 26/04/2016.
//  Copyright © 2016 Figofy. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class PaymentsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet var tableView: UITableView!
    
    var payments = [Payment]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        getFirebasePayments()

        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func getFirebasePayments(){
        let uid = Partner.staticPartner.id
        
        DataService.dataService.REF_PARTNER.childByAppendingPath(uid).observeEventType(.Value, withBlock: { seaId in
            //print(seaId)
            if let partnerDict = seaId.value as? Dictionary<String, AnyObject>{
                let partnerData = Partner(postKey: seaId.key, dictionary: partnerDict)
                //print(partnerData.seaId)
                let sea = DataService.dataService.REF_SEAS.childByAppendingPath(partnerData.seaId).childByAppendingPath("payment").observeEventType(.ChildAdded, withBlock: {snapshot in
                    //print(snapshot)
                    DataService.dataService.REF_PAYMENT.childByAppendingPath(snapshot.key).observeEventType(.Value, withBlock: { paySnap in
                        //print(paySnap)
                        if let payDict = paySnap.value as? Dictionary<String, AnyObject>{
                            let payData = Payment(postKey: snapshot.key, dictionary: payDict)
                            self.payments.append(payData)
                            print(self.payments[0].amount)
                        }
                        
                    })
                })
            }
            
        })
        
    }
    
    
    
    
    
}
