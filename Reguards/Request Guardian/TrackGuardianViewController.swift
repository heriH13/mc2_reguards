//
//  TrackGuardianViewController.swift
//  Reguards
//
//  Created by Farrel Brian on 28/06/22.
//

import UIKit

class TrackGuardianViewController: UIViewController {
    
    @IBOutlet weak var countView: UIView!
    
    var count = 0
    var t: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countView.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        t = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {_ in
            if (self.count) > 5 {
                self.showCountScreen()
                self.t?.invalidate()
            }
            self.count += 1
        })
        
    }
    
    func showCountScreen() {
        countView.isHidden = true
    }
    
}

