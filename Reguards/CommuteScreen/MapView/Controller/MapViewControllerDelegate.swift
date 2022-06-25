//
//  MapViewControllerDelegate.swift
//  Reguards
//
//  Created by Ricky on 24/06/22.
//

import Foundation
import CoreLocation
import MapKit
import UIKit
import GoogleMaps
extension MapViewController{
    @objc func receiveCoordinate(_ notification: Notification){
        guard let coordinate = notification.userInfo?["data"] as? [String: Any] else{
            fatalError()
        }
        guard let destinationCheck = coordinate["coordinate"] as? CLLocationCoordinate2D else{
            fatalError()
        }
        guard let place = coordinate["name"] as? Place else{
            fatalError()
        }

        destination = destinationCheck
        locationName = place
        
        if let sheetController = startCommutingLocationVC.sheetPresentationController {
                sheetController.detents = [.medium(), .large()]
            }
        
        
        locationSearchVC.dismiss(animated: true)
        
        drawDirection { status, error in
            if let flag = status {
                if flag {
                    self.pinLocation(coordinate: self.destination)
                    
                    let data = self.startCommutingLocationVC as? StartCommutingLocationController
                    data?.locationCoordinate = self.destination
                    data?.destinationName = self.locationName
                    data?.range = self.range
                    data?.predictionData = self.prediction
                    
                    self.present(self.startCommutingLocationVC, animated: true)
                }
                else {
                    // munculin pop up error gagal draw atau apa
                }
            }
        }
    }
    
    
}

//berursan dengan map
extension MapViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else{
            return
        }
        
        currentLocation = location.coordinate
        render()
        
        }
        func render(){
            let coordinate = CLLocationCoordinate2D(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
            pinLocation(coordinate: coordinate)
        }
}
