//
//  FilterCertificate.swift
//  UNIchoice
//
//  Created by Mac on 30.04.17.
//  Copyright © 2017 AMD. All rights reserved.
//

import UIKit

struct FilterCertificate: Hashable {
    var id: Int!
    var value: Double!
    var hashValue: Int {
        return self.id  
    }
    
    static func ==(lhs: FilterCertificate, rhs: FilterCertificate) -> Bool {
        return lhs.id == rhs.id
    }
}
