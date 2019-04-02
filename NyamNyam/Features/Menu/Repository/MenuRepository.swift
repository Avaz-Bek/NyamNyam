//
//  MenuRepository.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 4/2/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit
import RxSwift

class MenuRepository: NSObject {

    func getMenuFoods() -> Observable<[Menu]> {
        return Observable.create({ (observer) -> Disposable in
            ApiClient.instance.getMenuFoods(onCompletion: { (menues) in
                observer.onNext(menues)
                observer.onCompleted()
            }, onError: { (error) in
                observer.onError(NSError(message: error))
            })
            return Disposables.create()
        })
    }
}
