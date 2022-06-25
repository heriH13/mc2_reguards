//
//  StartCommutingActiveController.swift
//  HomePage
//
//  Created by Ricky on 16/06/22.
//

import Foundation
import UIKit



class StartCommutingActiveController: UIViewController{
    @IBOutlet weak var actionCollectionView: UICollectionView!
    
    @IBOutlet weak var endCommutingButton: UIButton!
    let actionAccess = Action()
    var actionList : [action] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        actionList = actionAccess.actionArrActive
        actionCollectionView.delegate = self
        actionCollectionView.dataSource = self
        actionCollectionView.actionCellRegister(nibName: "StartCommutingActiveCollectionViewCell", identifier: "actionActiveCell")
        
    }

}
