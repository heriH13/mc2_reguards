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
        
        self.view.bringSubviewToFront(viewList[sender.selectedSegmentIndex])
        counter = segmentedView.selectedSegmentIndex
    }
    
    
    func setTitleSegmented(){
        
        segmentedView.setTitle("Journey", forSegmentAt: 0)
        segmentedView.setTitle("Contacts", forSegmentAt: 1)
    }
}
