//
//  ExpensesBreakownView.swift
//  SwiftUI-ExponseReport
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct ExpensesBreakownView: View {
    
    @ObservedObject private var expensesBreakDown = ExpensesBreakDown()
    var categories = [ExpenseCategory]()
    @State var percent: CGFloat = 0.0
    
    var body: some View {
        VStack {
            HStack {
                Text("总费用").bold()
                Spacer()
                Text("￥\(String(format: "%2.f", expensesBreakDown.expense.consumed))").bold()
            }.padding(.vertical)
            
            VStack(spacing: 0) {
                ForEach(categories) { category in
                    ExpenseCategoryView(category: category)
                }
            }
        }
    }
}

struct ExpensesBreakownView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesBreakownView()
    }
}
