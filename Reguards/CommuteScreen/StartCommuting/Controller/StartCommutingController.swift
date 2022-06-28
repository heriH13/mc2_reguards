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
    var user: User?
    @IBOutlet weak var sosButton: UIButton!
    //    @IBOutlet weak var sosButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default
                          .addObserver(self,
                                       selector:#selector(receiveUser(_:)),
                         name: NSNotification.Name ("com.user.receive.User1"),                                           object: nil)
        actionList = actionAccess.actionArr
        
        actionCollectionView.delegate = self
        actionCollectionView.dataSource = self
        actionCollectionView.isScrollEnabled = false
        navigationController?.navigationBar.topItem?.title = "masuk pak eko"
        actionCollectionView.actionCellRegister(nibName: "StartCommutingCollectionViewCell", identifier: "actionCell")
        sosButton.Border()
        sosButton.addTarget(self, action: #selector(didPressed), for: .touchUpInside)
        
        
    }
    @IBAction func didSelectedStartCommuting(_ sender: Any) {
        
        performSegue(withIdentifier: "MapViewSegue", sender: self)
    }

    @objc func didPressed(){
        setUpBottomSheet()
    }
    
    func setUpBottomSheet() {
        
        //contact
        let contactData = user?.contacts?.allObjects as? [Contact]
        // logic for preparing sheet
        let vc = BottomSheetViewController()
        let storyboard = UIStoryboard(name: "BottomSheet", bundle: nil)
        let presentVC = storyboard.instantiateViewController(withIdentifier: "BottomSheet") as? BottomSheetViewController
        // logic to set bottom sheet data (set "Hidden" if you want to hide button)
        presentVC?.imageName = "Hidden"
        presentVC?.titleString = contactData?[0].name
        presentVC?.descString = contactData?[0].phone_number
        presentVC?.statusString = "Online and tracking you"
        presentVC?.firstString = "TES BTN"
        presentVC?.secondString = "Hidden"
        presentVC?.userIsOnline = false
        
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
    @objc func receiveUser(_ notification: Notification){

        guard let data = notification.userInfo?["data"] as? [User] else{
        
            fatalError()
        }
        self.user = data[0]
        print(data[0])
        

    }
}


