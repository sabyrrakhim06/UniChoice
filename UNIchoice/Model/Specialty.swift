//
//  Specialty.swift
//  UNIchoice
//
//  Created by Mac on 29.04.17.
//  Copyright © 2017 AMD. All rights reserved.
//

import UIKit
import RealmSwift

class Speciality: Object {
    dynamic var id: Int = 0
    dynamic var name: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
