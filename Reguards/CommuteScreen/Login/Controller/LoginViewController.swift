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
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        phoneNumberTF.clearText()
        passwordTF.clearText()
        passwordTF.isSecureTextEntry = true
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
        for data in database{
            //belum dilakukan validasi
            if(true){
                guard let commuteControllerVC = UIStoryboard(name: "CommuteScreen", bundle: nil).instantiateViewController(withIdentifier: "CommuteScreen") as? CommuteController else{
                    fatalError()
                }
                data.login = true
                commuteControllerVC.user = data
                self.present(commuteControllerVC, animated: true)
            }
        }
        let trigger = alert.displayAlert(title: "Wrong Email/Password", body: "email atau password yang anda masukkan salah", isDisplayDetail: true)
        self.present(trigger, animated: true, completion: nil)
    }
}
