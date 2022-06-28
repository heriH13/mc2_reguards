//
//  TabBarCorner.swift
//  Reguards
//
//  Created by Ricky on 27/06/22.
//

import Foundation
import UIKit
class TabBarCorner: UITabBarController {
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        let layer = CAShapeLayer()
//        layer.path = UIBezierPath(roundedRect: CGRect(x: 30, y: self.tabBar.bounds.minY - 3, width: self.tabBar.bounds.width - 60, height: self.tabBar.bounds.height + 10), cornerRadius: (self.tabBar.frame.width/2)).cgPath
        layer.path = UIBezierPath(roundedRect: CGRect(x: 30, y: self.tabBar.bounds.minY - 20, width: self.tabBar.bounds.width - 60, height: self.tabBar.bounds.height + 35), cornerRadius: 10).cgPath
        print("********* HEIGHT : \(tabBar.bounds.height)")
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.shadowRadius = 25.0
        layer.shadowOpacity = 0.3
        layer.borderWidth = 1.0
        layer.opacity = 1.0
        layer.isHidden = false
        layer.masksToBounds = false
        layer.fillColor = #colorLiteral(red: 0.56, green: 0.57, blue: 0.94, alpha: 1)
        
        self.tabBar.layer.insertSublayer(layer, at: 0)
        
        if let items = self.tabBar.items {
          items.forEach { item in item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) }
        }

        self.tabBar.itemWidth = 100.0
        self.tabBar.itemPositioning = .centered
    }

}

