//
//  Contact.swift
//  HomePage
//
//  Created by Ricky on 23/06/22.
//

import Foundation
import UIKit



struct contact{
    var image: UIImageView
    var name: UILabel
    var flag: Bool = true
}

class EmergencyContact{
    var contactList : [contact] = []
    
    
    
    func createContactList(listImageViewAction : [UIImageView], listName: [UILabel]){
        for i in 0..<listImageViewAction.count{
            contactList.append(contact(image: listImageViewAction[i], name: listName[i]))
            contactList[i].image.tag = i
        }
    }
}
