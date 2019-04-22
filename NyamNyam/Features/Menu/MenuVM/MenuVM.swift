//
//  MenuVM.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 4/21/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit
import FirebaseFirestore
import ObjectMapper
import RxSwift

enum MenuEvent{
    case Added
    case Removed
    case Changed
}

class MenuVM: NSObject {

    let menuSignal = PublishSubject<(MenuEvent, Menu)>()
    private let disposBag = DisposeBag()
    
    override init() {
        super.init()
    }
    
    func getMenu(){
        DatabaseRefManager.instance.menuRef.addSnapshotListener { (querySnapshot, error) in
            guard let snapshot = querySnapshot else{return}
            
            snapshot.documentChanges.forEach({ (diff) in
                if (diff.type == .added){
                    if let value = diff.document.data() as? [String:Any], let menu = Mapper<Menu>().map(JSON: value){
                        menu.id = diff.document.documentID
                        self.menuSignal.onNext((.Added, menu))
                    }
                }
                else if (diff.type == .modified){
                    if let value = diff.document.data() as? [String:Any], let menu = Mapper<Menu>().map(JSON: value){
                        menu.id = diff.document.documentID
                        self.menuSignal.onNext((.Changed, menu))
                    }
                }else if (diff.type == .removed){
                    if let value = diff.document.data() as? [String:Any], let menu = Mapper<Menu>().map(JSON: value){
                        menu.id = diff.document.documentID
                        self.menuSignal.onNext((.Removed, menu))
                    }
                }
            })
        }
    }
}
