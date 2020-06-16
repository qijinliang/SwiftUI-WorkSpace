//
//  File.swift
//  SwiftUI-ExponseReport
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct ExpenseCategory: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var percent: CGFloat = 0
    var amount: CGFloat = 0
    var colors: [Color] = []
}

class ExpensesBreakDown: ObservableObject {
    
    @Published var categories = [ExpenseCategory]()
    var expense = Expense()


    init() {
        generateRandom(Expense.getRandom().first(where: { $0.month == Date.month })!)
    }
    
    func generateRandom(_ expense: Expense){
        let percent1 = CGFloat.random(in: 0...1)
        let percent2 = CGFloat.random(in: 0...(1-percent1))
        let percent3 = CGFloat.random(in: 0...(1-(percent2+percent1)))
        let percent4 = CGFloat.random(in: 0...(1-(percent2+percent1+percent3)))
        let percent5 = 1 - (percent4+percent2+percent1+percent3)
        let categories = [
            ExpenseCategory(name: "便利店", percent: percent1, amount: expense.consumed * percent1, colors: [Color.red, Color.clearPurple]),
            ExpenseCategory(name: "教育类", percent: percent2, amount: expense.consumed * percent2, colors: [Color.darkYellow, Color.lightYellow]),
            ExpenseCategory(name: "家庭", percent: percent3, amount: expense.consumed * percent3, colors: [Color.darkPurple, Color.lightPurple]),
            ExpenseCategory(name: "饮食", percent: percent4, amount: expense.consumed * percent4, colors: [Color.red, Color.clearPurple]),
            ExpenseCategory(name: "生活", percent: percent5, amount: expense.consumed * percent5, colors: [Color.darkYellow, Color.lightYellow]),
        ]
        
        self.expense = expense
        
        self.categories = categories
    }
    
}




