//
//  NSDate-Extension.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/18.
//  Copyright © 2016年 han. All rights reserved.
//

import Foundation

extension Date {
    static func createDateString(createAtStr : String) -> String {
        // 時間格式化
        let fmt = DateFormatter()
        fmt.dateFormat = "EEE MM dd HH:mm:ss Z yyyy"
        fmt.locale = NSLocale(localeIdentifier: "en") as Locale!
        
        // 字符串轉NSDate
        guard let createDate = fmt.date(from: createAtStr) else {
            return ""
        }
        
        // 當前時間
        let nowDate = NSDate()
        
        // 計算與當前時間的差
        let interval = Int(nowDate.timeIntervalSince(createDate))
        
        
        // 一分鐘內
        if interval < 60 {
            return "剛剛"
        }
        
        // 幾分鐘前
        if interval < 60 * 60 {
            return "\(interval / 60)分鐘前"
        }
        
        // 幾小時前
        if interval < 60 * 60 * 24 {
            return "\(interval / (60 * 60))小時前"
        }
        
        // 當前日曆
        let calendar = NSCalendar.current
        
        // 昨天
        if calendar.isDateInYesterday(createDate) {
            fmt.dateFormat = "昨天 HH:mm"
            let timeStr = fmt.string(from: createDate)
            return timeStr
        }
        
        // 一年內
        let cmps = calendar.dateComponents(Set<Calendar.Component>([.year]), from: createDate, to: nowDate as Date)
        if cmps.year! < 1 {
            fmt.dateFormat = "MM-dd HH:mm"
            let timeStr = fmt.string(from: createDate)
            return timeStr
        }
        
        // 超過一年
        fmt.dateFormat = "yyyy-MM-dd HH:mm"
        let timeStr = fmt.string(from: createDate)
        return timeStr
    }
}
