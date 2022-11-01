//
//  GecmisSiparis.swift
//  RasitFoodFactory
//
//  Created by Rasit on 29.10.2022.
//

import Foundation
/*
class GecmisSiparisler : Codable {
    var context:String?
    var date:String?
    var totalPrice:String?
    
    init(context: String, totalPrice:String, date: String) {
        self.context = context
        self.totalPrice = totalPrice
        self.date = date
    }
}
*/

struct GecmisSiparisler {
    
    var _id: String
    var name: String
    var context: String
    var totalPrice: String
    var date: String
    var createdAt: String
    var __v: Int
    
    init(_ dictionary: [String: Any]) {
        self._id = dictionary["_id"] as? String ?? ""
        self.name = dictionary["name"] as? String ?? ""
        self.context = dictionary["context"] as? String ?? ""
        self.totalPrice = dictionary["totalPrice"] as? String ?? ""
        self.date = dictionary["date"] as? String ?? ""
        self.createdAt = dictionary["createdAt"] as? String ?? ""
        self.__v = dictionary["__v"] as? Int ?? 0
    }
    
}
