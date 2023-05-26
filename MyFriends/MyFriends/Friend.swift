//
//  Friend.swift
//  MyFriends
//
//  Created by 김동현 on 2023/05/26.
//

import Foundation

struct Friend: Codable {

    struct Address: Codable {
    let country: String
    let city: String
}

    let name: String
    let age: Int
    let address_info: Address
    
    var nameAndAge: String {
        return self.name + "(\(self.age))"
    }
    var fullAddress: String {
        return self.address_info.city + ", " + self.address_info.country
    }
    enum CodingKeys: String, CodingKey {
        case name, age
        case addressInfo = "address_info"
    }
}
