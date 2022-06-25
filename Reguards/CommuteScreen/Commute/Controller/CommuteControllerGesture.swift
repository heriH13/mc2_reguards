//
//  CommuteControllerGesture.swift
//  Reguards
//
//  Created by Ricky on 24/06/22.
//

import Foundation
import CoreLocation
import UIKit
//Gesture
extension CommuteController{
    
    func setGesture(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture: )))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture: )))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        self.view.bringSubviewToFront(journetView)
    }
    @objc func handleGesture(gesture: UISwipeGestureRecognizer){
       
        counter = 1 - counter
        self.view.bringSubviewToFront(viewList[counter])
        segmentedView.selectedSegmentIndex = counter
        
    }
}
