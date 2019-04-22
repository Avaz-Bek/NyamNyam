

//
//  MenuFood.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 4/21/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import Foundation
import ObjectMapper

class Menu: NSObject, Mappable {
    var id : String = ""
    var name : String = ""
    var image : String = ""
    
    required init?(map: Map) {
        super.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        image <- map["image"]
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let menu = object as? Menu {
            return self.id == menu.id
        } else {
            return false
        }
    }
    
}
