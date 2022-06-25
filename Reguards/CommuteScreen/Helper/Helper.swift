//
//  UIViewExtension.swift
//  HomePage
//
//  Created by Ricky on 15/06/22.
//

import Foundation
import UIKit


extension UIView{
    func createBorder(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
    }
    
    func createBorderLayer(){
        self.layer.shadowColor = UIColor(hex: "222345")?.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = .zero
        self.layer.opacity = 1
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}

extension UICollectionView{
    func actionCellRegister(nibName: String, identifier: String){
        //start commute
        let nibCell = UINib(nibName: nibName, bundle: nil)
        self.register(nibCell, forCellWithReuseIdentifier: identifier)
        
    }
}

extension UIButton{
    func Border(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

extension UITextField{
    func clearText(){
        self.text = ""
    }

}
