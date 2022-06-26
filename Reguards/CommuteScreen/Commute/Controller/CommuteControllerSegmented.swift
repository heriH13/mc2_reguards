//
//  CommuteControllerSegmented.swift
//  Reguards
//
//  Created by Ricky on 24/06/22.
//

import Foundation
import CoreLocation
import UIKit
//segmented
extension CommuteController{
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        
        if(sender.selectedSegmentIndex == 1){
         sendUser()
        }
        self.view.bringSubviewToFront(viewList[sender.selectedSegmentIndex])
        counter = segmentedView.selectedSegmentIndex
        
    }
    
    
    func setTitleSegmented(){
        
        segmentedView.setTitle("Journey", forSegmentAt: 0)
        segmentedView.setTitle("Contacts", forSegmentAt: 1)
    }
    
    func sendUser(){
        let data = ["data" : [user]]
        NotificationCenter.default
                    .post(name: NSNotification.Name("com.user.receive.User"),
                     object: nil,
                     userInfo: data)
        
    }
}
