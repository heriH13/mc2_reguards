//
//  CallConfirmationViewController.swift
//  Reguards
//
//  Created by Farrel Brian on 20/06/22.
//

import UIKit

class CallConfirmationViewController: UIViewController {

    @IBOutlet weak var requestBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        startPulseAnimation()
    }
    
    @IBAction func onTapBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "callConfirm", sender: self)
    }
    
    @IBAction func unwindToCallConfirm(_ unwindSegue: UIStoryboardSegue) {

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
