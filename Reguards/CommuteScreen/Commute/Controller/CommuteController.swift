//
//  ViewController.swift
//  HomePage
//
//  Created by Ricky on 14/06/22.
//

import UIKit
import CoreLocation

class CommuteController: UIViewController{
    
    @IBOutlet weak var segmentedView: UISegmentedControl!
    
    //view 1 untuk tampilan start commute
    @IBOutlet weak var journetView: UIView!
    //view 2 untuk tampilan ketika sudah melakukan start commuting
    @IBOutlet weak var journeyActiveView: UIView!
    //view untuk menampilkan contact
    @IBOutlet weak var guardingRingView: UIView!

    //segmented
    var counter = 0
    var viewList: [UIView] = []
    var onCommute: Bool = false
    //location
    let manager =  CLLocationManager()
    var locationCoordinate =  CLLocationCoordinate2D()
    var destination : CLLocationCoordinate2D?
    
    //untuk melakukan pengiriman coredata
    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        viewList = [journetView,guardingRingView]
        title = "Journey"
        segmentedView.selectedSegmentIndex =  counter
        setTitleSegmented()
        setGesture()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate =  self
        
    }
    //start Commuting
    func selectedStartCommuting() {
        
        self.view.bringSubviewToFront(journeyActiveView)
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    
}












