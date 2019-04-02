//
//  Extensions.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 4/2/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

extension NSError {
    
    convenience init(message:String?, code: Int = 200) {
        
        let errorMessage = message != nil ? message : NSLocalizedString("Ошибка", comment: "")
        
        let userInfo: [String : Any] =
            [
                NSLocalizedDescriptionKey as String : errorMessage as Any
        ]
        
        self.init(domain: "",code: code, userInfo: userInfo)
    }
}
