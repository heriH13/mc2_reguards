//
//  Alert.swift
//  Reguards
//
//  Created by Ricky on 24/06/22.
//

import Foundation
import UIKit
class Alert{
    func displayAlert(title: String, body: String, isDisplayDetail: Bool)-> UIAlertController {
        let alert = UIAlertController.init(title: title, message: body, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction.init(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(alertAction)
        return alert
        
    }
}
