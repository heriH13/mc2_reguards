//
//  GuardingRingController.swift
//  HomePage
//
//  Created by Ricky on 15/06/22.
//

import Foundation
import Contacts
import ContactsUI
import UIKit



class GuardingRingController: UIViewController, CNContactPickerDelegate{
    
    
    
    
    @IBOutlet weak var layerOne: UIView!
    @IBOutlet weak var layerTwo: UIView!
    @IBOutlet weak var layerThree: UIView!
    
    //UIImagebutton
    @IBOutlet weak var cPerson1: UIImageView!
    @IBOutlet weak var cPersonName1: UILabel!
    @IBOutlet weak var cPerson2: UIImageView!
    @IBOutlet weak var cPersonName2: UILabel!
    @IBOutlet weak var cPerson3: UIImageView!
    @IBOutlet weak var cPersonName3: UILabel!
    @IBOutlet weak var cPerson4: UIImageView!
    @IBOutlet weak var cPersonName4: UILabel!
    @IBOutlet weak var cPerson5: UIImageView!
    @IBOutlet weak var cPersonName5: UILabel!
    @IBOutlet weak var cPerson6: UIImageView!
    @IBOutlet weak var cPersonName6: UILabel!
    var contactPersonButton : [UIButton] = []
    var image: UIImage?
    var name: String = ""
    var number: String = ""
    var counter = 0
    var user : User!
    var contactClass = EmergencyContact()
    override func viewDidLoad() {
        super.viewDidLoad()
        layerBorder()
        setUpButton()
        NotificationCenter.default
                          .addObserver(self,
                                       selector:#selector(receiveUser(_:)),
                         name: NSNotification.Name ("com.user.receive.User"),                                           object: nil)
        
    }
    func setUpButton(){
        contactClass.createContactList(
            listImageViewAction: [cPerson1, cPerson2, cPerson3, cPerson4, cPerson5, cPerson6],
                                       listName: [cPersonName1, cPersonName2, cPersonName3, cPersonName4, cPersonName5, cPersonName1])
        
        
        for i in 0...5{
            let action = UITapGestureRecognizer(target: self, action: #selector(didSelectedContact(tapGestureRecognizer:)))
            contactClass.contactList[i].image.isUserInteractionEnabled = true
            contactClass.contactList[i].image.addGestureRecognizer(action)
        }
        

    }
    
    func layerBorder(){
        layerOne.createBorder()
        layerTwo.createBorder()
        layerThree.createBorder()
    }
    
    @objc func didSelectedContact(tapGestureRecognizer: UITapGestureRecognizer){
        
        guard let flag = tapGestureRecognizer.view as? UIImageView else{
            fatalError()
        }
        counter = flag.tag
        
        
        if (contactClass.contactList[counter].flag == false){
            //mengisi untuk buttom sheet edit
        }else{
            //mengisi buttom sheet ketika milih dan pindahkan code ini ke fungsi untuk menambahkan
            let vc = CNContactPickerViewController()
            vc.delegate =  self
            present(vc, animated: true)
        }
        
    }
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        
        name = contact.givenName
        image = UIImage(data: contact.imageData!)
        //error karena number masih dalam bentuk CNNumber
        
//        let data = contact.phoneNumbers.ValueTy
//        number = contact.phoneNumbers
        number = "abcdef"

        contactClass.contactList[counter].image.image = image
        contactClass.contactList[counter].name.text = name
        contactClass.contactList[counter].flag = true
        
        let newContact = Contact(context: context)
        newContact.name = name
        
        //perru terpadat perubahan data base untuk contact
//        newContact.image = contact.imageData
//        newContact.phone_number = contact.phoneNumbers
        user.addToContacts(newContact)
        
    }
    func checkContact(){
        let dataContact = user.contacts?.allObjects as! [Contact]
        var i = 0
        for contactButton in contactClass.contactList {
//            contactButton.image = dataContact[i].image
            contactButton.name.text = dataContact[i].name
            i += 1
        }
    }
    @objc func receiveUser(_ notification: Notification){
        guard let data = notification.userInfo?["data"] as? [User] else{
            fatalError()
        }
        self.user = data[0]
    }

}

