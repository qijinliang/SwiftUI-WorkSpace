//
//  BarView.swift
//  SwiftUI-ExponseReport
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct BarView: View {
    
    var size: CGSize = .zero
    var expense = Expense.getRandom().first!
    var isSelected = false
    var onSelected: ((Expense)->()) = {_ in}
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .frame(width: 3, height: size.height)
                    .foregroundColor(Color.lightGray)
                
                Capsule()
                    .frame(width: 3, height: size.height * expense.percentConsumend)
                    .foregroundColor(isSelected ? Color.red : Color.purpleGray)
            }.animation(.easeIn(duration: 1))
            
            Text(expense.month).font(.caption).foregroundColor(isSelected ? Color.red : Color.purpleGray).frame(maxWidth: .infinity)
                .onTapGesture {
                    self.onSelected(self.expense)
            }
        }
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView()
    }
}
