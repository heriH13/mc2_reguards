//
//  StartCommutingLocation.swift
//  HomePage
//
//  Created by Ricky on 17/06/22.
//

import Foundation

import UIKit
import CoreLocation

class StartCommutingLocationController: UIViewController{
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var transportationCollectionView: UICollectionView!
    @IBOutlet weak var destination: UILabel!
    @IBOutlet weak var street: UILabel!
    
    
    let transport = Trasportation()
    let transportList = transport.trasportationList
    var locationCoordinate : CLLocationCoordinate2D?
    var destinationName : Place?
    var predictionData : Dictionary<String, Any>?
    var range: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transportationCollectionView.delegate = self
        transportationCollectionView.dataSource = self
        
        transportationCollectionView.register(UINib(nibName: "TransportationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "transportCell")
        
        let locationArr: [String] = destinationName?.name.components(separatedBy: ",") ?? [""]
            
        destination.text = locationArr[0]
        street.text = locationArr[1]
        distance.text = range+" km"
    }
    
    @objc func transportationClicked(sender: UIButton){
        let counter = sender.tag
        for i in 0..<transportList.count{
            if(transportList[i] == false && i == counter){
                transportList[i].flag = true
            }else{
                transportList[i].flag  = false
            }
            
        }
        transportationCollectionView.reloadData()
    }

}





