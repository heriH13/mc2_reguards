//
//  CallingViewController.swift
//  Reguards
//
//  Created by Farrel Brian on 20/06/22.
//
//  Controller for video call screen

import UIKit
import SendBirdCalls
import Commons
import Photos

class CallingViewController: UIViewController {

    var countVC: CountupViewController?
    
    var call: DirectCall!
    
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var endBtn: UIButton!
    @IBOutlet weak var countUpView: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var requestGuardianBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelBtn.layer.borderWidth = 2
        cancelBtn.layer.borderColor = UIColor(red: 0.22, green: 0.22, blue: 0.37, alpha: 1.00).cgColor
        cancelBtn.layer.cornerRadius = 25
        
        endBtn.layer.borderWidth = 2
        endBtn.layer.borderColor = UIColor(red: 0.22, green: 0.22, blue: 0.37, alpha: 1.00).cgColor
        endBtn.layer.cornerRadius = 25
        
        endBtn.isHidden = true
        requestGuardianBtn.isHidden = true
        cancelBtn.isHidden = false
        
        if call != nil {
            let localView2 = SendBirdVideoView(frame: self.videoView.frame)
            videoView.embed(localView2)
            call?.updateLocalVideoView(localView2)
            
            let remoteView = SendBirdVideoView(frame: self.view.frame)
            view.embed(remoteView)
            call?.updateRemoteVideoView(remoteView)
        }

        call?.delegate = self
    }
        
    @IBAction
    func didTapEndCallButton(_ sender: UIButton) {
        call?.end()
    }
    
    @IBAction func didTapCancelBtn(_ sender: Any) {
        call?.end()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CountupViewController {
                    // save reference to VC embedded in Container View
                    self.countVC = vc
                }
    }
    
    @IBAction func didTapRequestGuardianBtn(_ sender: Any) {
    }
    
    func deauthenticate() {
        SendBirdCall.deauthenticate { (error) in
            guard error == nil else { return }
            
            print("Successfully deauthenticated from SendBirdCalls")
        }
    }
}

extension CallingViewController: DirectCallDelegate {
    func didConnect(_ call: DirectCall) {
        countVC?.t?.invalidate()
        countUpView.isHidden = true
        cancelBtn.isHidden = true
        endBtn.isHidden = false
        requestGuardianBtn.isHidden = false
        print("Call connected")
    }
    
    func didEnd(_ call: DirectCall) {
        self.dismiss(animated: true) {
            
            print("Successfully finished")
        }
    }
}
