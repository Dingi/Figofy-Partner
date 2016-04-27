//
//  PaymentCell.swift
//  Figofy Partner
//
//  Created by Tommy on 27/04/2016.
//  Copyright © 2016 Figofy. All rights reserved.
//
import UIKit
import Foundation
import Firebase
class PaymentCell: UITableViewCell {
    
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var productTextField: UILabel!
    @IBOutlet weak var timeTextField: UILabel!
    @IBOutlet weak var priceTextField: UILabel!
    
    func configureCell(payment: Payment){
        
        timeTextField.text = payment.boughtTimeStart
        productTextField.text = payment.product
        nameTextField.text = payment.name
        priceTextField.text = "Beløb: \(payment.amount) Kr"
        
        
    }
}