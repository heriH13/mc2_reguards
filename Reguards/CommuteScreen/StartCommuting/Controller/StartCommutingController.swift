//
//  ActionController.swift
//  HomePage
//
//  Created by Ricky on 15/06/22.
//

import Foundation
import UIKit



class StartCommutingController: UIViewController{
    

    @IBOutlet weak var actionCollectionView: UICollectionView!
    let actionAccess = Action()
    var actionList: [action] = []
    @IBOutlet weak var sosButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        actionList = actionAccess.actionArr
        
        actionCollectionView.delegate = self
        actionCollectionView.dataSource = self
        actionCollectionView.isScrollEnabled = false
        
        actionCollectionView.actionCellRegister(nibName: "StartCommutingCollectionViewCell", identifier: "actionCell")
        sosButton.Border()
        
    }
    @IBAction func didSelectedStartCommuting(_ sender: Any) {
        performSegue(withIdentifier: "MapViewSegue", sender: self)
    }
    
    @IBAction func didPressedSOSButton(_ sender: Any) {
        //untuk sos button
    }
}


