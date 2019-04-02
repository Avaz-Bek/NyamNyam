//
//  ApiClient.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 4/2/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import ObjectMapper

class ApiClient: NSObject {
    
    static let instance = ApiClient()
    
    let url = ""
    
    func getMenuFoods(onCompletion: @escaping (([Menu]) -> Void), onError: @escaping ((String?) -> Void)) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization" : ""]).responseJSON(completionHandler: { (response) in
            if let result = response.result.value as? [String: Any] {
                let foods = Mapper<Menu>().mapArray(JSONArray: [result])
                onCompletion(foods)
            }
            
        })
    }
}
