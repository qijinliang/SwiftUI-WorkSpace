//
//  ProfileView.swift
//  SwiftUI-AppStore
//
//  Created by qjinliang on 2020/6/24.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
     @ObservedObject var expensesBreakDown = ExpensesBreakDown()
    
    var body: some View {
        VStack {
            renderHeader()
            ScrollView(showsIndicators: false) {
                VStack {
                    renderCards()
                    renderBarchart()
                    ExpensesBreakownView(categories: expensesBreakDown.categories)
                        .padding(.horizontal)
                }
            }
        }
    }
    
    fileprivate func renderCards() -> some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(expensesBreakDown.categories) { category in
                    CardView(category: (category)).frame(width: 330, height: UIScreen.main.bounds.height * 0.22)
                }
            }.padding(.horizontal)
        }
    }
    
    fileprivate func renderHeader() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(Date.fullMonthName(short: expensesBreakDown.expense.month)).font(.title)
                Text("2019年").foregroundColor(Color.purpleGray)
            }
            Spacer()
        }.padding(.horizontal)
    }
    
    fileprivate func renderBarchart() -> some View {
        return BarChartView(onSelected: { selectedExp in
            self.expensesBreakDown.generateRandom(selectedExp)
            }).frame(height: 50)
            .padding(.vertical, 20)
            .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
