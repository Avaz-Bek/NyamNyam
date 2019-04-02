//
//  Menu.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 4/2/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit
import ObjectMapper

class Menu: NSObject, Mappable {
    
    var id: String = ""
    var name: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
}
