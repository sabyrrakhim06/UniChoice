//
//  Certificate.swift
//  UNIchoice
//
//  Created by Mac on 29.04.17.
//  Copyright © 2017 AMD. All rights reserved.
//

import Foundation
import RealmSwift

class Certificate: Object {
    dynamic var id: Int = 0
    dynamic var name: String? = nil
    dynamic var value: Double = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func ==(lhs: Certificate, rhs: Certificate) -> Bool {
        return lhs.id == rhs.id
    }
}
