//
//  ExpenseCategoryView.swift
//  SwiftUI-ExponseReport
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct ExpenseCategoryView: View {
    
    var category = ExpenseCategory()
    @State private var percent: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { gr in
            ZStack(alignment: .leading) {
                self.renderHorizontalChart(with: gr.size)
                HStack {
                    self.renderRingView()
                    Text(self.category.name).font(.system(size: 15, weight: .light))
                    Spacer()
                    Text("￥\(String(format: "%.2f", self.category.amount))").font(.system(size: 15, weight: .light))
                }.padding(5)
                    .onAppear() {
                        self.percent = self.category.percent
                }
            }
        }.frame(height: 60)
    }
    
    fileprivate func renderRingView() -> some View {
        return RingView(stokeWidth: CGFloat(3), size: CGSize(width: 35, height: 35), color: self.category.colors.first!, pathColor: Color.lightGray, percent: self.$percent)
            .modifier(PercentAnimator(value: self.percent, font: .caption, color: .textColor).animation(.easeIn(duration: 1)))
    }
    
    fileprivate func renderHorizontalChart(with size: CGSize) -> some View {
        return Rectangle().frame(width: size.width * self.percent, height: size.height, alignment: .leading)
            .foregroundColor(Color.lightGray)
            .animation(.easeIn(duration: 1  ))
    }
}

struct ExpenseCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseCategoryView()
    }
}
