//
//  Transportation.swift
//  Reguards
//
//  Created by Ricky on 24/06/22.
//

import Foundation


struct transportation{
    var image: String
    var flag: Bool
}

class Trasportation{
    var trasportationList : [transportation] = [
        transportation(image: "car", flag: false),
        transportation(image: "bicycle", flag: false),
        transportation(image: "figure.walk", flag: false),
        transportation(image: "tram", flag: false)
    ]
}
