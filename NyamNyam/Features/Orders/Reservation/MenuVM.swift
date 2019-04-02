//
//  MenuVM.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 4/2/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit
import RxSwift

class MenuVM: NSObject {

    let menuBR = BehaviorRelay<[[NotifComment]]>(value: [])
    
    func getFirstPage() {
        repository.getComments(offset: 0)
            .subscribe(onNext: { (likes) in
                self.hasMoreData = likes.count > 0
                
                if likes.isEmpty {
                    self.allCommentsBR.accept([])
                    return
                }
                
                let tomorowDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
                let yesterdayDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
                let afterWeekDate = Calendar.current.date(byAdding: .day, value: 7, to: Date())!
                let beforeWeekDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
                let afterMonthDate = Calendar.current.date(byAdding: .day, value: 30, to: Date())!
                let beforeMonthDate = Calendar.current.date(byAdding: .day, value: -30, to: Date())!
                
                var day = [NotifComment]()
                var week = [NotifComment]()
                var month = [NotifComment]()
                var older = [NotifComment]()
                
                for like in likes {
                    let notifyDate = like.notifyDate ?? Date()
                    if notifyDate <= afterMonthDate && notifyDate <= beforeMonthDate {
                        older.append(like) // older
                    } else if notifyDate <= afterWeekDate && notifyDate <= beforeWeekDate {
                        month.append(like) // week
                    } else if notifyDate <= tomorowDate && notifyDate <= yesterdayDate {
                        week.append(like) // week
                    } else {
                        day.append(like) // day
                    }
                }
                self.allCommentsBR.accept([day,week, month, older])
            }, onError: { (error) in
                self.errorBR.accept(error)
            })
            .disposed(by: disposeBag)
        
    }
}
