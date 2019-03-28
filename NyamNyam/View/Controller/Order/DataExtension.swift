//
//  DataExtension.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/28/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import Foundation
import UIKit

extension Date{
    
    static func calculateDate(day:Int,month:Int,year:Int,hour:Int,minute:Int,second:Int) -> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let calculateData = formatter.date(from: "\(year)/\(month)/\(day)/\(hour):/\(minute)")
        return calculateData!
    }
    
    func getDayMonthYearHourMinuteSecond() -> (day:Int,month:Int,year:Int,hour:Int,minute:Int,second:Int) {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let year = calendar.component(.year, from: self)
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        let second = calendar.component(.second, from: self)
        
        return (day,month,year,hour,minute,second)
    }
}
