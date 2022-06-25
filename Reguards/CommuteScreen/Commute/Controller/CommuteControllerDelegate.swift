//
//  CommuteControllerDelegate.swift
//  Reguards
//
//  Created by Ricky on 24/06/22.
//

import Foundation
import CoreLocation
import UIKit
// Unwind
extension CommuteController{
    @IBAction func unwindCommuteScreen( _ seg: UIStoryboardSegue) {

        guard let data = seg.source as? StartCommutingLocationController else{
            fatalError()
        }
        
        onCommute = true
        self.destination = data.locationCoordinate
        self.view.bringSubviewToFront(journeyActiveView)
        viewList[0] = journeyActiveView
        
    }
    @IBAction func unwindCommuteScreenFromEndCommuting( _ seg: UIStoryboardSegue){
        

        self.view.bringSubviewToFront(journetView)
        viewList[0] = journetView
        manager.stopUpdatingLocation()
    }
}
