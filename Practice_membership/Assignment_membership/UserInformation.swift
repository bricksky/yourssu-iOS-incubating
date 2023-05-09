//
//  UserInformation.swift
//  Practice_membership
//
//  Created by 김동현 on 2023/05/10.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var name: String?
    var age: String?
}
