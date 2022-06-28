//
//  CallConfirmUpViewController.swift
//  Reguards
//
//  Created by Farrel Brian on 28/06/22.
//

import UIKit
import SendBirdCalls
import Commons
import Photos

class CallConfirmUpViewController: UIViewController {


    
    @IBOutlet weak var requestBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticate()
        requestBtn.addTarget(self, action: #selector(didTapRequest), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        startPulseAnimation()
    }
    
    @objc func didTapRequest(){
        print("******** MASUK ")
        let calleeId = "TestUser1"
        
        let dialParams = DialParams(calleeId: calleeId,
                                    isVideoCall: true,
                                    callOptions: CallOptions(isAudioEnabled: true, isVideoEnabled: true),
                                    customItems: [:])
        SendBirdCall.dial(with: dialParams) { (call, error) in
            guard let call = call, error == nil else { return }
            
//            DispatchQueue.main.async {
        self.performSegue(withIdentifier: "dial", sender: call)
//            }
        }
    }
    
//    @IBAction func onTapBtn(_ sender: UIButton) {
//        let calleeId = "TestUser1"
//
//        let dialParams = DialParams(calleeId: calleeId,
//                                    isVideoCall: true,
//                                    callOptions: CallOptions(isAudioEnabled: true, isVideoEnabled: true),
//                                    customItems: [:])
//        SendBirdCall.dial(with: dialParams) { (call, error) in
//            guard let call = call, error == nil else { return }
//
////            DispatchQueue.main.async {
//        self.performSegue(withIdentifier: "dial", sender: call)
////            }
//        }
//    }
    
//    @IBAction func unwindToCallConfirm(_ unwindSegue: UIStoryboardSegue) {
//
//    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? CallingViewController,
              let call = sender as? DirectCall else { return }

        destination.call = call
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
