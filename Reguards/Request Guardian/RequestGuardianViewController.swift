//
//  RequestGuardianViewController.swift
//  Reguards
//
//  Created by Farrel Brian on 28/06/22.
//

import UIKit

class RequestGuardianViewController: UIViewController {

    @IBOutlet weak var requestBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewDidLayoutSubviews() {
        startPulseAnimation()
    }
    
    @IBAction func onTapBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "requestGuardianSegue", sender: sender)
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
    }
    
    func setUpView() {
        cancelBtn.layer.borderWidth = 2
        cancelBtn.layer.borderColor = UIColor(red: 0.22, green: 0.22, blue: 0.37, alpha: 1.00).cgColor
        cancelBtn.layer.cornerRadius = 25
    }
    
    func startPulseAnimation() {
        requestBtn?.layer.cornerRadius = (requestBtn?.frame.height ?? 200) / 2
        requestBtn?.clipsToBounds = true
        
        let pulse1 = PulseAnimation(numOfPulse: Float.infinity, radius: 160, position: requestBtn.center)
        pulse1.animationDuration = 2
        pulse1.backgroundColor = UIColor(red: 0.10, green: 0.10, blue: 0.20, alpha: 1.00).cgColor
        self.view.layer.insertSublayer(pulse1, below: self.view.layer)
        
        let pulse = PulseAnimation(numOfPulse: Float.infinity, radius: 130, position: requestBtn.center)
        pulse.animationDuration = 2
        pulse.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.30, alpha: 1.00).cgColor
        self.view.layer.insertSublayer(pulse, below: self.view.layer)
        
        self.view.bringSubviewToFront(requestBtn)
        }
    }

