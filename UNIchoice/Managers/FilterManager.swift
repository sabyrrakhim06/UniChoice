//
//  FilterManager.swift
//  UNIchoice
//
//  Created by Mac on 30.04.17.
//  Copyright © 2017 AMD. All rights reserved.
//

import UIKit

class FilterManager: NSObject {

    static let sharedInstance = FilterManager()
    
    var country: Country?
    var price = 100000
    var certificates = Set<FilterCertificate>()
}
