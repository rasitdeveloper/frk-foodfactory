//
//  User.swift
//  RasitFoodFactory
//
//  Created by Rasit on 31.10.2022.
//

import Foundation

struct User {
    
    var _id: String
    var email: String
    var password: String
    var role: String
    var __v: Int
    
    init(_ dictionary: [String: Any]) {
        self._id = dictionary["_id"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.password = dictionary["password"] as? String ?? ""
        self.role = dictionary["role"] as? String ?? ""
        self.__v = dictionary["__v"] as? Int ?? 0
    }
    
}
