//
//  Exponse.swift
//  SwiftUI-ExponseReport
//
//  Created by qjinliang on 2020/6/15.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct Expense{

    var month: String = ""
    var budget: CGFloat = 0 
    var consumed: CGFloat = 0
    var percentConsumend: CGFloat = 0
    
    static var months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Otc","Nov","Dec"]
    
    static func getRandom() -> [Expense] {
        months.map { month in
            let budget = CGFloat.random(in: 2000...5000)
            let consumed = CGFloat.random(in: 2000...budget)
            let percentConsumend = consumed / budget
            return Expense(month: month, budget: budget, consumed: consumed, percentConsumend: percentConsumend)
        }
    }
}
