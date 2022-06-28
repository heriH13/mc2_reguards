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
    
    @IBOutlet weak var sosButton: UIButton!
    @IBOutlet weak var endCommutingButton: UIButton!
    let actionAccess = Action()
    var actionList : [action] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        actionList = actionAccess.actionArrActive
        actionCollectionView.delegate = self
        actionCollectionView.dataSource = self
        actionCollectionView.actionCellRegister(nibName: "StartCommutingActiveCollectionViewCell", identifier: "actionActiveCell")
        sosButton.Border()
    }

    @IBAction func didPressedSos(_ sender: Any) {
        setUpBottomSheet()
    }
    
    func setUpBottomSheet() {
        // logic for preparing sheet
        let vc = BottomSheetViewController()
        let storyboard = UIStoryboard(name: "BottomSheet", bundle: nil)
        let presentVC = storyboard.instantiateViewController(withIdentifier: "BottomSheet") as? BottomSheetViewController
        
        // logic to set bottom sheet data (set "Hidden" if you want to hide button)
        presentVC?.imageName = "ProfilePict"
        presentVC?.titleString = "Farrel"
        presentVC?.descString = "085156595835"
        presentVC?.statusString = "Online and tracking you"
        presentVC?.firstString = "Hidden"
        presentVC?.secondString = "Hidden"
        presentVC?.userIsOnline = true
        
        // logic to set up sheet button action
        presentVC?.onPressFirst = {
            print("1")
        }
        
        presentVC?.onPressSecond = {
            print("2")
        }

        // logic to present sheet
        presentVC?.modalPresentationStyle = .overCurrentContext
        if presentVC != nil {
            present(presentVC ?? vc, animated: true, completion: nil)
        }
    }
    
}
