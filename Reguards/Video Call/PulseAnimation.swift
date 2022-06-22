//
//  PulseAnimation.swift
//  Reguards
//
//  Created by Farrel Brian on 20/06/22.
//

import Foundation
import UIKit

class PulseAnimation: CALayer {
    
    var animationGroup = CAAnimationGroup()
    var animationDuration: TimeInterval = 1.5
    var pulseRadius: CGFloat = 220
    var numOfPulse: Float = 10
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(numOfPulse: Float = 10, radius: CGFloat, position: CGPoint){
        super.init()
        self.backgroundColor = UIColor.black.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.pulseRadius = radius
        self.numOfPulse = numOfPulse
        self.position = position
        
        self.bounds = CGRect(x: 0, y: 0, width: radius*2, height: radius*2)
        self.cornerRadius = radius
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.setUpAnimationGroup()
            DispatchQueue.main.async {
                self.add(self.animationGroup, forKey: "pulse")
            }
        }
    }
    
    func scaleAnimation() -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: 0)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = animationDuration
        return scaleAnimation
    }
    
    func createOpacityAnimation() -> CAKeyframeAnimation {
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = animationDuration
        opacityAnimation.keyTimes = [0, 0.8, 1]
        opacityAnimation.values = [1, 1, 0]
        return opacityAnimation
    }
    
    func setUpAnimationGroup() {
        self.animationGroup.duration = animationDuration
        self.animationGroup.repeatCount = numOfPulse
        let defaultCurve = CAMediaTimingFunction(name: .default)
        self.animationGroup.timingFunction = defaultCurve
        self.animationGroup.animations = [scaleAnimation(), createOpacityAnimation()]
    }
    
}
