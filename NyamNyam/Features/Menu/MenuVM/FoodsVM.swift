//
//  FoodsVM.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 4/21/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit
import RxSwift
import FirebaseFirestore
import ObjectMapper

enum FoodsEvent{
    case Added
    case Removed
    case Changed
}
class FoodsVM: NSObject {
    let foodsSignal = PublishSubject<(MenuEvent, Foods)>()
    override init() {
        super.init()
    }
    
    func getFoods(menuId: String){
        DatabaseRefManager.instance.foodsRef.addSnapshotListener { (querySnapshot, error) in
            guard let snapshot = querySnapshot else{return}
            
            snapshot.documentChanges.forEach({ (diff) in
                if (diff.type == .added){
                    if let value = diff.document.data() as? [String:Any], let food = Mapper<Foods>().map(JSON: value){
                        food.id = diff.document.documentID
                        self.foodsSignal.onNext((.Added, food))
                    }
                }
                else if (diff.type == .modified){
                    if let value = diff.document.data() as? [String:Any], let food = Mapper<Foods>().map(JSON: value){
                        food.id = diff.document.documentID
                        self.foodsSignal.onNext((.Changed, food))
                    }
                }else if (diff.type == .removed){
                    if let value = diff.document.data() as? [String:Any], let food = Mapper<Foods>().map(JSON: value){
                        food.id = diff.document.documentID
                        self.foodsSignal.onNext((.Removed, food))
                    }
                }
            })
        }

    }
}
