//
//  Date.swift
//  SwiftUI-ExponseReport
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

extension Date {
    static var month: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: Date())
    }
    
    static func fullMonthName(short: String) -> String {
        let months = [
            "一月":"一月",
            "二月":"二月",
            "三月":"三月",
            "四月":"四月",
            "五月":"五月",
            "六月":"六月",
            "七月":"七月",
            "八月":"八月",
            "九月":"九月",
            "十月":"十月",
            "十一月":"十一月",
            "十二月":"十二月",
        ]
        
        return months[short] ?? "一月"
    }
}
