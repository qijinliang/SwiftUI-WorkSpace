//
//  Exponse.swift
//  SwiftUI-ExponseReport
//
//  Created by qjinliang on 2020/6/15.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct Exponse: Identifiable{
    
    var id: UUID = UUID()
    var month: String = ""
    var budget: CGFloat = 0 //预算
    var consumed: CGFloat = 0 //实际花费
    var percentConsumend: CGFloat = 0
    
    static var months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Otc","Nov","Dec"]
    
    static func getRandom() -> [Exponse] {
        months.map { month in
            let budget = CGFloat.random(in: 2000...10000)
            let consumed = CGFloat.random(in: 2000...budget)
            let percentConsumend = consumed / budget
            return Exponse(month: month, budget: budget, consumed: consumed, percentConsumend: percentConsumend)
        }
    }
}
