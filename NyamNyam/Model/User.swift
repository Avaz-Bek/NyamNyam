//
//  User.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 4/20/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import Foundation
import ObjectMapper

class User:NSObject, Mappable{
    
    required init?(map: Map) {
        super.init()
    }
    
    var id : String = ""
    var username : String = ""
    var email : String = ""
    
    func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
        email <- map["email"]
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let user = object as? User {
            return self.id == user.id
        } else {
            return false
        }
    }
    
}
