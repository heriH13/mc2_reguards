//
//  BottomSheetViewController.swift
//  Reguards
//
//  Created by Farrel Brian on 26/06/22.
//

// function to show bottom sheet (put in button action)
/*
 // add this function as button action to show sheet
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
*/

import UIKit

class BottomSheetViewController: UIViewController {

    // outlet
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    
    // sheet parameter variable
    var viewTranslation = CGPoint(x: 0, y: 0)
    let swipeThreshold: CGFloat = 100
    
    // data variable
    var imageName: String?
    var titleString: String?
    var descString: String?
    var statusString: String?
    var firstString: String?
    var secondString: String?
    var userIsOnline: Bool?
    var onPressFirst: (()->())?
    var onPressSecond: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSheet()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let heightDiff:CGFloat = contentStackView.frame.height + 64
        contentViewHeight.constant = heightDiff
    }
    
    @objc
    func handleDismiss (recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            viewTranslation = recognizer.translation(in: view)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                guard self.viewTranslation.y > 0 else {return}
                self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
            })
        case .ended:
            if viewTranslation.y < swipeThreshold {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.transform = .identity
                })
            } else {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }
    
    @IBAction func didTapFirstBtn(_ sender: Any) {
        onPressFirst?()
    }
    
    @IBAction func didTapSecondBtn(_ sender: Any) {
        onPressSecond?()
    }
    
    func setUpSheet() {
        
        let image: UIImage? = UIImage(named: imageName ?? "Default")
        if imageName == "Hidden" {
        } else {
            profileImageView.image = image
        }
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true
        
        if userIsOnline == true {
            profileImageView.layer.borderWidth = 5
            profileImageView.layer.borderColor = UIColor(red: 0.38, green: 0.25, blue: 0.84, alpha: 1.00).cgColor
        }
        
        if titleString == "Hidden" {
            titleLabel.isHidden = true
        } else {
            titleLabel.text = titleString
        }
        
        if descString == "Hidden" {
            descLabel.isHidden = true
        } else {
            descLabel.text = descString
        }
        
        if statusString == "Hidden" {
            statusLabel.isHidden = true
        } else {
            statusLabel.text = statusString
        }
        
        if firstString == "Hidden" {
            firstBtn.isHidden = true
        } else {
            firstBtn.setTitle(firstString, for: .normal)
        }
        
        if secondString == "Hidden" {
            secondBtn.isHidden = true
        } else {
            secondBtn.setTitle(secondString, for: .normal)
        }
        
        contentView.layer.cornerRadius = 25
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleDismiss(recognizer:)))
        panGestureRecognizer.cancelsTouchesInView = false
        contentView.addGestureRecognizer(panGestureRecognizer)
    }
}
