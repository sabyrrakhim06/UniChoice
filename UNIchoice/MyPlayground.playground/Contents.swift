//: Playground - noun: a place where people can play

import UIKit
import RealmSwift
import Foundation


class Country: Object {
    dynamic var id: Int = 0
    dynamic var name: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Specialty: Object {
    dynamic var id: Int = 0
    dynamic var name: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Certificate: Object {
    dynamic var id: Int = 0
    dynamic var name: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class University: Object {
    
    dynamic var id: Int = 0
    dynamic var name: String? = nil
    dynamic var country: Country!
    let specialities = List<Specialty>()
    let certificates = List<Certificate>()
    var price: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

let university = University(value: ["id" : 1,
                   "name" : "MIT",
                   "country": ["id": 1, "name": "USA"],
                   "specialities": [["id" : 1, "name": "Computer science"],["id" : 2, "name": "Social science"]],
                   "certificates": [["id": 1, "name": "IELTS"]]] )


let realm = try! Realm()

try! realm.write {
    realm.add(university, update: true)
}

let universities = realm.objects(University.self)
universities.first?.name

let countries = realm.objects(Country.self)
countries.first?.name

let specailities = realm.objects(Specialty.self)
specailities.first?.name

let certificates = realm.objects(Certificate.self)
certificates.first?.name

let name = "ASdasd"
let age = 14
String(format: "my age = %i", age)

