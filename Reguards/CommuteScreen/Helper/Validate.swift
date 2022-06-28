//
//  Validate.swift
//  Reguards
//
//  Created by Ricky on 24/06/22.
//

import Foundation


class Validate{
    func numValidate(_ num: String) ->Bool{
        
        let regExpression = ".*[0-9].*"
        
        let check = NSPredicate(format: "SELF MATCHES %@", regExpression)
        if(!check.evaluate(with: num)){
            return false
        }
        return true
    }
    func checkEmptyField(data: String)->Bool{
        if(data.isEmpty){
            return true
        }
        return false
    }
}
