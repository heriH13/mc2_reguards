//
//  StartPageViewController.swift
//  Reguards
//
//  Created by Ricky on 24/06/22.
//

import Foundation
import UIKit

class StartPageViewController: UIViewController{
    @IBOutlet weak var loginButtom: UIButton!
    let databaseAction = CoredataController()
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLogin()
        loginButtom.Border()
    }
    override func viewWillAppear(_ animated: Bool) {
        databaseAction.fetchScope()
    }
    
    func checkLogin(){
        for data in database{
            if(data.login == true){
                
                performSegue(withIdentifier: "NavigationSegue", sender: data)
            }
        }
    }
    @IBAction func didPressedLogin(_ sender: Any) {
        performSegue(withIdentifier: "LoginViewSegue", sender: self)
    }
    @IBAction func didPressedRegister(_ sender: Any) {
        performSegue(withIdentifier: "RegisterScreenSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ""{
            
            let vc = segue.destination as? CommuteController
            let senderData = sender as? User
            vc?.user = senderData
//            vc?.delegate = self
            
        }
    }
    @IBAction func unwindToStart( _ seg: UIStoryboardSegue){
        
    }
    
    
}
