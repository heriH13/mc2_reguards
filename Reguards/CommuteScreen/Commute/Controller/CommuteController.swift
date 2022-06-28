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

    @IBOutlet weak var topTitle: UINavigationBar!
    //segmented
    var counter = 0
    var viewList: [UIView] = []
    var onCommute: Bool = false
    //location
    let manager =  CLLocationManager()
    var locationCoordinate =  CLLocationCoordinate2D()
    var destination : CLLocationCoordinate2D?
    let titleList : [String] = ["Journey", "Contacts"]
    //untuk melakukan pengiriman coredata
    var user: User?
    override func viewDidLoad() {
        super.viewDidLoad()

        viewList = [journetView,guardingRingView]
        segmentedView.selectedSegmentIndex =  counter
        setTitleSegmented()
        topTitle.topItem?.title = titleList[counter]
        setGesture()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate =  self
        
    }
    //start Commuting
    func selectedStartCommuting() {
        
        self.view.bringSubviewToFront(journeyActiveView)
//        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
    }

    deinit {
      NotificationCenter.default
       .removeObserver(self, name: NSNotification.Name("com.user.receive.User"), object: nil)
        NotificationCenter.default
         .removeObserver(self, name: NSNotification.Name("com.user.receive.User1"), object: nil)
        
        
    }
    
}
