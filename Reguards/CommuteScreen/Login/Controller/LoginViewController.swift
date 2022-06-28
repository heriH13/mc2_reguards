//
//  LoginViewController.swift
//  Reguards
//
//  Created by Ricky on 25/06/22.
//

import Foundation

import UIKit


class LoginViewController: UIViewController{
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    var alert = Alert()
    var userInformation = userData()
    var validate = Validate()
    let dataBaseAction = CoredataController()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        phoneNumberTF.clearText()
        passwordTF.clearText()
//        passwordTF.isSecureTextEntry = true
    }
    @IBAction func phoneNumberChanged(_ sender: Any) {
        if let phoneNumber = phoneNumberTF.text{
            if(validate.numValidate(phoneNumber)){
                userInformation.phone = phoneNumber

            }else{
                phoneNumberTF.text = ""
                userInformation.password = phoneNumber
                
            }
        }

    }
    @IBAction func passwordChanged(_ sender: Any) {
        userInformation.password = passwordTF.text ?? ""
    }
    @IBAction func didLoginPressed(_ sender: Any) {
        var counter = false
        for data in database{
            //belum dilakukan validasi
            if(data.phoneNumber == userInformation.phone && data.password == userInformation.password){
                performSegue(withIdentifier: "NavigationSegue", sender: data)
                counter = true
                break
            }
        }
        if(counter == false){
            let trigger = alert.displayAlert(title: "Wrong Email/Password", body: "email atau password yang anda masukkan salah", isDisplayDetail: true)
            self.present(trigger, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "NavigationSegue"){
            let vc = segue.destination as? CommuteController
            let senderData = sender as? User
            senderData?.login = true
            do{
                try context.save()
            }catch{
                fatalError()
            }
            vc?.user = senderData
            
            
            
        }
    }
}
