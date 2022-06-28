//
//  OnboardingViewController.swift
//  Reguards
//
//  Created by Farrel Brian on 27/06/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var imageScrollView: UIScrollView!
    var scrollImageTimer: Timer!
    @IBOutlet weak var firstProgressView: UIProgressView!
    @IBOutlet weak var secondProgressView: UIProgressView!
    @IBOutlet weak var thirdProgressView: UIProgressView!
    
    var t: Timer!
    var count: Int! = 0
    
    let images = ["L1_Screen1","L2_Screen1","L3_Screen1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProgressBar()
        setScrollableBackground()
        setTimer()
    }
    
    @objc func updateProgress(){
        firstProgressView.setProgress(firstProgressView.progress+0.0025, animated: true)
        if firstProgressView.progress >= 1.0 {
            secondProgressView.setProgress(secondProgressView.progress+0.0025, animated: true)
        }
        if secondProgressView.progress >= 1.0 {
            thirdProgressView.setProgress(thirdProgressView.progress+0.0025, animated: true)
        }
        if thirdProgressView.progress >= 1.0 {
            t.invalidate() // stop the timer
        }
    }
    
    func setUpProgressBar() {
        firstProgressView.setProgress(0, animated: false)
        secondProgressView.setProgress(0, animated: false)
        thirdProgressView.setProgress(0, animated: false)
        
        t = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    
    func setTimer() {
        scrollImageTimer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
    }
    
    func setScrollableBackground() {
        self.imageScrollView.frame = self.view.frame
        self.imageScrollView.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        let scrollViewWidth:CGFloat = self.imageScrollView.frame.width
        let scrollViewHeight:CGFloat = self.imageScrollView.frame.height
        
        for index in 0..<images.count {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(index) * scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
            imageView.image = UIImage(named: images[index])
            imageView.contentMode = .scaleAspectFit
            
            self.imageScrollView.addSubview(imageView)
        }
        
        self.imageScrollView.contentSize = CGSize(width:self.imageScrollView.frame.width * CGFloat(images.count), height: self.imageScrollView.frame.height)
        
        self.imageScrollView.isScrollEnabled = false
    }
    
    @objc func moveToNextPage() {
        let pageWidth:CGFloat = self.imageScrollView.frame.width
        let maxWidth:CGFloat = pageWidth * CGFloat(images.count)
        let contentOffset:CGFloat = self.imageScrollView.contentOffset.x
        var slideToX = contentOffset + pageWidth
        if  contentOffset + pageWidth == maxWidth {
            slideToX = 0
        }
        self.imageScrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.imageScrollView.frame.height), animated: true)
        count+=1
        if count >= 2 {
            scrollImageTimer.invalidate()
            // put segue here for automatic segue to first page
        }
    }

}
