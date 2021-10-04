//
//  University.swift
//  UNIchoice
//
//  Created by Mac on 29.04.17.
//  Copyright © 2017 AMD. All rights reserved.
//

import UIKit
import RealmSwift

class University: Object {
    
    dynamic var id: Int = 0
    dynamic var name: String? = nil
    dynamic var imageName: String!
    dynamic var buildYearName: String!
    dynamic var country: Country!
    let specialities = List<Speciality>()
    let certificates = List<Certificate>()
    dynamic var price: Int = 0
    dynamic var rating: Int = 3
    dynamic var studentNumber: Int = 1
    dynamic var contestForPlace: Int = 1
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
