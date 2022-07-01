//
//  CountdownViewController.swift
//  Reguards
//
//  Created by Farrel Brian on 28/06/22.
//

import UIKit

class CountdownViewController: UIViewController {

    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var countdownCircle: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    
    let shape = CAShapeLayer()
    var counter = 0
    var t:  Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        countdownCircle?.layer.cornerRadius = (countdownCircle?.frame.height ?? 200) / 2
        
         t = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            print(self.counter)
            if self.counter < 5 {
                DispatchQueue.main.async {
                    self.countdownLabel.text = String(self.counter)
                }
            } else {
                Timer.invalidate()
            }
            self.counter += 1
        }
    }
    
    override func viewDidLayoutSubviews() {
        let circlePath = UIBezierPath(arcCenter: countdownCircle.center, radius: 85, startAngle: -(.pi / 2), endAngle: .pi * 2, clockwise: true)
        
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 15
        trackShape.strokeColor = UIColor(red: 0.45, green: 0.30, blue: 1.00, alpha: 1.00).cgColor
        view.layer.addSublayer(trackShape)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = UIColor(red: 0.45, green: 0.30, blue: 1.00, alpha: 1.00).cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        
        view.layer.addSublayer(shape)
        
        cancelBtn.layer.borderWidth = 2
        cancelBtn.layer.borderColor = UIColor(red: 0.22, green: 0.22, blue: 0.37, alpha: 1.00).cgColor
        cancelBtn.layer.cornerRadius = 25
        
//        let concurrentQueue = DispatchQueue(label: "concurrent.queue", attributes: .concurrent)
//
//        concurrentQueue.async {
//            self.circularProgressAnimation()
//        }
        
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
    }
    
    func circularProgressAnimation() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 5
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "circularProgress")
    }
}
