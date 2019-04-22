//
//  DatabaseRefManager.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 4/21/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit
import Firebase

enum Route : String{
    case Menu = "menu"
    case Foods = "menuItems"
    
}

class DatabaseRefManager: NSObject {
    static let instance = DatabaseRefManager()
    
    let menuRef = Firestore.firestore().collection(Route.Menu.rawValue)
    let foodsRef = Firestore.firestore().collection(Route.Foods.rawValue)
}
