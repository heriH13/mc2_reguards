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

    var call: DirectCall!
    
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var endBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        endBtn?.layer.cornerRadius = (endBtn?.frame.height ?? 68) / 2
        
        if call != nil {
            let localView = SendBirdVideoView(frame: videoView.frame)
            videoView.embed(localView)
            call?.updateLocalVideoView(localView)
            
            let remoteView = SendBirdVideoView(frame: self.view.frame)
            view.embed(remoteView)
            call?.updateRemoteVideoView(remoteView)
        }

        call?.delegate = self
    }
        
    @IBAction
    func didTapEndCallButton(_ sender: UIButton) {
        call?.end()
        deauthenticate()
//        self.navigationController?.popToRootViewController(animated: true)
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
        print("Call connected")
    }
    
    func didEnd(_ call: DirectCall) {
        self.dismiss(animated: true) {
            print("Successfully finished")
        }
    }
}
