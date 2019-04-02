//
//  MenuVM.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 4/2/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MenuVM: NSObject {
    
    let dispose = DisposeBag()
    let menuBR = BehaviorRelay<[Menu]>(value: [])
    let errorBR = BehaviorRelay<Error>(value: NSError.init(message: ""))
    
    let repository = MenuRepository()
    
    func getFoods() {
        repository.getMenuFoods()
            .subscribe(onNext: { (menues) in
                self.menuBR.accept(menues)
            }, onError: { (error) in
                self.errorBR.accept(error)
            }).disposed(by: dispose)
        
    }
}
