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
    var users = [User]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        getFirebasePayments()
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payments.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "PaymentCell"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? PaymentCell{
            
            let payment = self.payments[indexPath.row]
            cell.configureCell(payment)
            return cell
        }else{
            return UITableViewCell()
        }
    }
    func getFirebasePayments(){
        let uid = Partner.staticPartner.id
        self.payments = []
        
        DataService.dataService.REF_PARTNER.childByAppendingPath(uid).observeEventType(.Value, withBlock: { seaId in
            //print(seaId)
            if let partnerDict = seaId.value as? Dictionary<String, AnyObject>{
                let partnerData = Partner(postKey: seaId.key, dictionary: partnerDict)
                //print(partnerData.seaId)
                DataService.dataService.REF_SEAS.childByAppendingPath(partnerData.seaId).childByAppendingPath("payment").observeEventType(.ChildAdded, withBlock: {snapshot in
                    //print(snapshot)
                    
                    DataService.dataService.REF_PAYMENT.childByAppendingPath(snapshot.key).observeEventType(.Value, withBlock: { paySnap in
                        //print(paySnap)
                        if let payDict = paySnap.value as? Dictionary<String, AnyObject>{
                            let payData = Payment(postKey: snapshot.key, dictionary: payDict)
                            self.payments.append(payData)
                            //print("\(self.payments[0].time_created)")
                            
                            
                        }
                        self.sortListByTimeCreated()
                    })
                })
            }
            
            
        })
        
        
    }
    func sortListByTimeCreated(){
        payments.sortInPlace({$0.time_created > $1.time_created})
        self.tableView.reloadData()
    }
    
    
    
    
}
