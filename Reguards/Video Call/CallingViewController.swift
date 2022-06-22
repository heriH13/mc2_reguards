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
    
    @IBOutlet weak var localVideoView: UIView!
    @IBOutlet weak var endBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        endBtn?.layer.cornerRadius = 10

        let remoteView = SendBirdVideoView(frame: self.view.frame)
        view.embed(remoteView)
        let localView = SendBirdVideoView(frame: localVideoView.frame)
        localVideoView.embed(localView)
        
        call?.updateRemoteVideoView(remoteView)
        call?.updateLocalVideoView(localView)
        
        call?.delegate = self
    }
    
    @IBAction
    func didTapEndCallButton(_ sender: Any) {
        call?.end()
        self.navigationController?.popToRootViewController(animated: true)
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
