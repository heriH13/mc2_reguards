//
//  CoredataController.swift
//  Reguards
//
//  Created by heri hermawan on 15/06/22.
//

import Foundation
import CoreData
import UIKit

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
var database : [User] = []

class CoredataController {
    
    func saveData(){
            do{
                try context.save()
            }catch{
                print("error")
            }
            self.fetchScope()
        }

    func fetchScope(){
        do{
            try database = context.fetch(User.fetchRequest())
        }catch{
            fatalError()
        }
    }
   
}
