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
        
        loginButtom.Border()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        databaseAction.fetchScope()
        checkLogin()
    }
    func checkLogin(){
        for data in database{
            print(data.name)
            print(data.login)
            
            if(data.login){
                performSegue(withIdentifier: "NavigationSegue", sender: data)
                break
            }
        }
    }
    @IBAction func didPressedLogin(_ sender: Any) {
        performSegue(withIdentifier: "LoginViewSegue", sender: self)
    }
    @IBAction func didPressedRegister(_ sender: Any) {
        performSegue(withIdentifier: "RegisterScreenSegue", sender: self)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "NavigationSegue"{
//
//            let vc = segue.destination as? TabBarCorner
//            let senderData = sender as? User
//            vc?.user = senderData
//
//
////            vc?.delegate = self
//
//        }
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NavigationSegue"{
            
            let barViewControllers = segue.destination as! TabBarCorner
            let destinationViewController = barViewControllers.viewControllers![0] as! CommuteController
            let senderData = sender as? User
            destinationViewController.user = senderData
        }
           
        
    }
    @IBAction func unwindToStart( _ seg: UIStoryboardSegue){
        
    }
    
    
}
