//
//  LoginScreenViewController.swift
//  Reguards
//
//  Created by Ricky on 24/06/22.
//

import Foundation
import UIKit

class RegisterScreenViewController: UIViewController{

    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let validate = Validate()
    var userInformation = userData()
    let alert = Alert()
    let databaseAction = CoredataController()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
        nameTF.clearText()
        phoneTF.clearText()
        passwordTF.clearText()
//        passwordTF.isSecureTextEntry = true
        
    }
    
    
    @IBAction func nameChanged(_ sender: Any) {
        userInformation.name = nameTF.text ?? ""
    }
    
    @IBAction func phoneChanged(_ sender: Any) {
        if let phoneNumber = phoneTF.text{
            if(validate.numValidate(phoneNumber)){
                userInformation.phone = phoneNumber

            }else{
                phoneTF.text = ""
                userInformation.password = phoneNumber
                
            }
            
        }
    }

    @IBAction func passwordChanged(_ sender: Any) {
//        var counter = passwordTF.isSecureTextEntry
        userInformation.password = passwordTF.text ?? ""
//        passwordTF.isSecureTextEntry = true
 
    }
    @IBAction func didRegisterPressed(_ sender: Any) {
        var trigger : UIAlertController
        if(validate.checkEmptyField(data: userInformation.name)){
            
            trigger = alert.displayAlert(title: "name empty", body: "insert your name", isDisplayDetail: true)
            self.present(trigger, animated: true, completion: nil)
            
        }else if(validate.checkEmptyField(data: userInformation.phone)){
            
            trigger = alert.displayAlert(title: "phone number empty", body: "insert your phone number", isDisplayDetail: true)
            self.present(trigger, animated: true, completion: nil)
            
        }else if(validate.checkEmptyField(data: userInformation.password)){
            trigger = alert.displayAlert(title: "password empty", body: "insert your password", isDisplayDetail: true)
            self.present(trigger, animated: true, completion: nil)
            
            
        }else{
            // name, phone number , password
            // user id, name, username, login
            
//            database.append()
            let newUser = User(context: context)
            newUser.name = userInformation.name
            newUser.user_id = String(database.count)
            newUser.login = false
            newUser.phoneNumber = userInformation.phone
            newUser.password = userInformation.password
            database.append(newUser)
            databaseAction.saveData()
            
        }
    }
    
}
