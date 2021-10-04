//
//  DataManager.swift
//  UNIchoice
//
//  Created by Mac on 29.04.17.
//  Copyright © 2017 AMD. All rights reserved.
//

import UIKit
import RealmSwift


class DataManager: NSObject {
    
    class func initData() {
        let realm = try! Realm()
        
        
        try! realm.write {
            realm.add(University(value: ["id" : 1,
                                         "name" : "MIT",
                                         "imageName" : "MIT",
                                         "studentNumber": 11319,
                                         "buildYearName": "1861",
                                         "contestForPlace": 12,
                                         "price" : 62946,
                                         "rating" : 9,
                                         "country": ["id": 1, "name": "USA"],
                                         "specialities": [["id" : 1, "name": "Computer science"],["id" : 2, "name": "Social science"]],
                                         "certificates": [["id": 1, "name": "IELTS", "value": 8]]] ),
                      update: true)
            realm.add(University(value: ["id" : 2,
                                         "name" : "Harvard",
                                         "imageName" : "harvard",
                                         "studentNumber": 21200,
                                         "buildYearName": "1636",
                                         "contestForPlace": 12,
                                         "price" : 75000,
                                         "rating" : 10,
                                         "country": ["id": 1, "name": "USA"],
                                         "specialities": [["id" : 1, "name": "Computer science"],["id" : 2, "name": "Social science"]],
                                         "certificates": [["id": 2, "name": "TOEFL", "value": 90]]] ),
                      update: true)
            realm.add(University(value: ["id" : 3,
                                         "name" : "NU",
                                         "imageName" : "NU",
                                         "studentNumber": 4017,
                                         "buildYearName": "2009",
                                         "contestForPlace": 12,
                                         "price" : 10000,
                                         "rating" : 6,
                                         "country": ["id": 2, "name": "KAZAKHSTAN"],
                                         "specialities": [["id" : 2, "name": "Social science"]],
                                         "certificates": [["id": 2, "name": "TOEFL", "value": 80]]] ),
                      update: true)
            realm.add(University(value: ["id" : 4,
                                         "name" : "Yale",
                                         "imageName" : "yale",
                                         "studentNumber": 12312,
                                         "buildYearName": "1701",
                                         "contestForPlace": 14,
                                         "price" : 62725,
                                         "rating" : 7,
                                         "country": ["id": 1, "name": "USA"],
                                         "specialities": [["id" : 1, "name": "Computer science"],["id" : 2, "name": "Social science"]],
                                         "certificates": [["id": 1, "name": "IELTS", "value": 7]]] ),
                      update: true)
            realm.add(University(value: ["id" : 5,
                                         "name" : "Princeton",
                                         "imageName" : "princeton",
                                         "studentNumber": 13316,
                                         "buildYearName": "1746",
                                         "contestForPlace": 15,
                                         "price" : 63420,
                                         "rating" : 8,
                                         "country": ["id": 1, "name": "USA"],
                                         "specialities": [["id" : 1, "name": "Computer science"],["id" : 2, "name": "Social science"]],
                                         "certificates": [["id": 1, "name": "IELTS", "value": 7]]] ),
                      update: true)

            realm.add(University(value: ["id" : 6,
                                         "name" : "Oxford",
                                         "imageName" : "oxford",
                                         "studentNumber": 19791,
                                         "buildYearName": "1095",
                                         "contestForPlace": 13,
                                         "price" : 28072,
                                         "rating" : 6,
                                         "country": ["id": 3, "name": "UK"],
                                         "specialities": [["id" : 1, "name": "Computer science"],["id" : 2, "name": "Social science"]],
                                         "certificates": [["id": 1, "name": "IELTS", "value": 8]]] ),
                      update: true)

            realm.add(University(value: ["id" : 7,
                                         "name" : "Cambridge",
                                         "imageName" : "camridge",
                                         "studentNumber": 18977,
                                         "buildYearName": "1209",
                                         "contestForPlace": 15,
                                         "price" : 14552,
                                         "rating" : 8,
                                         "country": ["id": 3, "name": "UK"],
                                         "specialities": [["id" : 1, "name": "Computer science"],["id" : 2, "name": "Social science"]],
                                         "certificates": [["id": 1, "name": "IELTS", "value": 6]]] ),
                      update: true)

        }
    }
}
