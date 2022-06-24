//
//  ViewController.swift
//  MapsLocation
//
//  Created by Ricky on 14/06/22.
//

import Foundation
import CoreLocation
import MapKit
import UIKit
import GoogleMaps
class MapViewController: UIViewController{

    
    @IBOutlet weak var map: GMSMapView!
    let manager =  CLLocationManager()
    var currentLocation = CLLocationCoordinate2D()
    var destination =  CLLocationCoordinate2D()
    var locationName : Place?
    var range: String = ""
    var prediction: Dictionary<String, Any>?

    var locationSearchVC = UIStoryboard(name: "LocationSearchView", bundle: nil).instantiateViewController(withIdentifier: "LocationSearchView")
    var startCommutingLocationVC = UIStoryboard(name: "StartCommutingLocation", bundle: nil).instantiateViewController(withIdentifier: "StartCommutingLocation")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default
                          .addObserver(self,
                                       selector:#selector(receiveCoordinate(_:)),
                         name: NSNotification.Name ("com.user.receive.Coordinate"),                                           object: nil)
        if let sheetController = locationSearchVC.sheetPresentationController {
                sheetController.detents = [.medium(), .large()]
        }
        self.present(locationSearchVC, animated: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.delegate =  self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    deinit {
      NotificationCenter.default
       .removeObserver(self, name: NSNotification.Name("com.user.receive.Coordinate"), object: nil) }
}


