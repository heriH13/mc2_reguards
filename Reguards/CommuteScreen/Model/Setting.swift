//
//  Setting.swift
//  Reguards
//
//  Created by Ricky on 25/06/22.
//

import Foundation
import UIKit

struct setting{
    var image : UIImage!
    var name : String
}

class Setting{
    var settingList : [setting] = [
        setting(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), name: "Logout"),
        setting(image: UIImage(systemName: "note.text"), name: "notifications")
    ]
}
