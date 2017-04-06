//
//  AlertController.swift
//  BVCarSharing
//
//  Created by VBond on 4/5/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit

class AlertController: NSObject {
    
    static func messageAlert(title: String, message:String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        return alert
    }
    
    
    static func alert(title: String) -> UIAlertController {
        return messageAlert(title: title, message: "")
    }
    
    static func okDialog(title: String) -> UIAlertController {
        let alertController = self.alert(title: title)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { action in }
        alertController.addAction(okAction)
        return alertController
    }
    
    static func okDialogWithInput(title: String,
                                  okAction: @escaping (_ text : String) -> Void) -> UIAlertController {
        let alertController = self.alert(title: title)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
        let okAction = UIAlertAction(title: "Ok", style: .default) { action in
            if let tf = alertController.textFields?[0].text {
                okAction(tf)
            } else {
                okAction("")
            }
        }
        
        alertController.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Moscow"
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        return alertController
    }
}
