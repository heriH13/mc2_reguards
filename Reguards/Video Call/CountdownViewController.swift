//
//  CountdownViewController.swift
//  Reguards
//
//  Created by Farrel Brian on 20/06/22.
//

import UIKit
import SendBirdCalls
import Commons

class CountdownViewController: UIViewController {

    @IBOutlet weak var cancelDialBtn: UIButton!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var countdownCircle: UIView!
    @IBOutlet weak var proceedBtn: UIButton!
    let shape = CAShapeLayer()
    var counter = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        countdownCircle?.layer.cornerRadius = (countdownCircle?.frame.height ?? 200) / 2
        proceedBtn.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        let circlePath = UIBezierPath(arcCenter: countdownCircle.center, radius: 85, startAngle: -(.pi / 2), endAngle: .pi * 2, clockwise: true)
        
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 15
        trackShape.strokeColor = UIColor(red: 0.18, green: 0.18, blue: 0.30, alpha: 1.00).cgColor
        view.layer.addSublayer(trackShape)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = UIColor(red: 0.45, green: 0.30, blue: 1.00, alpha: 1.00).cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        
        view.layer.addSublayer(shape)
        
        cancelDialBtn.layer.borderWidth = 2
        cancelDialBtn.layer.borderColor = UIColor(red: 0.22, green: 0.22, blue: 0.37, alpha: 1.00).cgColor
        cancelDialBtn.layer.cornerRadius = 25
        
        let concurrentQueue = DispatchQueue(label: "concurrent.queue", attributes: .concurrent)
        
        concurrentQueue.async {
            self.circularProgressAnimation()
        }
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            print(self.counter)
            if self.counter > 0 {
                self.countdownLabel.text = String(self.counter)
                self.counter -= 1
            } else {
                self.countdownLabel.isHidden = true
                self.proceedBtn.isHidden = false
                Timer.invalidate()
            }
        }
    }
    
    @IBAction func didTapCancelDialBtn(_ sender: Any) {
    }
    
    @IBAction func proceedBtn(_ sender: Any) {
        self.authenticate()
        let calleeId = "TestUser1"
        
        let dialParams = DialParams(calleeId: calleeId,
                                    isVideoCall: true,
                                    callOptions: CallOptions(isAudioEnabled: true, isVideoEnabled: true),
                                    customItems: [:])
        SendBirdCall.dial(with: dialParams) { (call, error) in
            guard let call = call, error == nil else { return }
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "call", sender: call)
            }
        }
    }
    
    
    func circularProgressAnimation() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 5
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "circularProgress")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? CallingViewController,
              let call = sender as? DirectCall else { return }

        destination.call = call
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func authenticate() {
        let userId = "085156595835"
        
        let authenticateParams = AuthenticateParams(userId: userId)
        SendBirdCall.authenticate(with: authenticateParams) { (user, error) in
            guard let user = user, error == nil else { return }
            
            SendBirdCall.registerRemotePush(token: UserDefaults.standard.remotePushToken, completionHandler: nil)
            
            print("Successfully authenticated with userId: \(user.userId)")
        }
    }
    
    func deauthenticate() {
        SendBirdCall.deauthenticate { (error) in
            guard error == nil else { return }
            
            print("Successfully deauthenticated from SendBirdCalls")
        }
    }
}
