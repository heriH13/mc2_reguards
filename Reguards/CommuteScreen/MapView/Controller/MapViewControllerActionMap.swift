//
//  MapViewControllerActionMap.swift
//  Reguards
//
//  Created by Ricky on 24/06/22.
//

import Foundation
import CoreLocation
import MapKit
import UIKit
import GoogleMaps

//untuk melakukan aksi dengan maps
extension MapViewController{
    //gambar route
    func drawDirection(completionHandler: @escaping (Bool?, Error?) -> Void) {
        let from = "\(currentLocation.latitude),\(currentLocation.longitude)"
        let to = "\(destination.latitude),\(destination.longitude)"
        
        let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(from)&destination=\(to)&mode=driving&key=AIzaSyAb5Qo0X_zuYfLIcCpRY8x0vbvn3IwdJ7o"

        let url = URL(string: urlString)

        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if(error != nil){
                print("error")
            }else{
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: AnyObject]
                    
                    let routes = json["routes"] as! NSArray
                    for route in routes {
                        let routeOverviewPolyline: NSDictionary = (route as! NSDictionary).value(forKey: "overview_polyline") as! NSDictionary

                        let points = routeOverviewPolyline.object(forKey: "points")
                        let path = GMSPath.init(fromEncodedPath: points! as! String)
                        let polyline = GMSPolyline.init(path: path)
                        polyline.strokeWidth = 3
                        polyline.strokeColor = .green
                        let bounds = GMSCoordinateBounds(path: path!)
                        DispatchQueue.main.async {
                            self.map.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 30.0))
                        }
                        
                        polyline.map = self.map
                    }

                    self.totalDistance { status, error in
                        if let flag = status {
                            if flag {
                                completionHandler(true, nil)
                            }
                        }
                    }
                    
                }catch let error as NSError{
                    print("error: \(error)")
                    
                    completionHandler(false, error)

                }
            }
        }).resume()
    }
    // mendapatkan waktu
    func totalDistance(completionHandler: @escaping (Bool?, Error?) -> Void){
        let from = "\(currentLocation.latitude),\(currentLocation.longitude)"
        let to = "\(destination.latitude),\(destination.longitude)"
        let urlString =
        "https://maps.googleapis.com/maps/api/distancematrix/json?destinations=\(to)&origins=\(from)&units=imperial&mode=driving&key=AIzaSyAb5Qo0X_zuYfLIcCpRY8x0vbvn3IwdJ7o"
        
        let url = URL(string: urlString)

        URLSession.shared.dataTask(with: url!, completionHandler: { [self]
            (data, response, error) in
            if(error != nil){
                print("error")
            }else{
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: AnyObject]
                    let rows = json["rows"] as! NSArray
                    print(rows)

                    let dic = rows[0] as! Dictionary<String, Any>
                    let elements = dic["elements"] as! NSArray
                    let dis = elements[0] as! Dictionary<String, Any>
                    let distanceMiles = dis["distance"] as! Dictionary<String, Any>
                    let miles = distanceMiles["text"] as! String

                    let time = miles.replacingOccurrences(of: "mi", with: "")
                    
                    self.range = time
                    completionHandler(true, nil)

                }catch let error as NSError{
                    print("error:\(error)")
                    completionHandler(false, error)
                }
            }

        }).resume()
    }
    func pinLocation(coordinate: CLLocationCoordinate2D){
        
        let camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 14.0)
        DispatchQueue.main.async {
            self.map.camera = camera
        }
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
        marker.map = self.map
    }
}
