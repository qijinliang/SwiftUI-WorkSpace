//
//  CardView.swift
//  SwiftUI-ExponseReport
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var category = ExpenseCategory()
    @State var percent: CGFloat = 0.0
    
    var body: some View {
        
        VStack {
            HStack(spacing: 20) {
                renderRing()
                renderDetails()
            }.frame(maxWidth: .infinity, maxHeight: 200)
            .padding()
                .background(LinearGradient(gradient: Gradient(colors: category.colors), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
        }.onAppear {
            self.percent = self.category.percent
        }
    }
    
    fileprivate func renderRing() -> some View {
        return RingView(percent: self.$percent).modifier(PercentAnimator(value: self.percent * 100,color: .white, suffix: "%").animation(.easeIn(duration: 1)))
    }
    
    fileprivate func renderDetails() -> some View {
        VStack(alignment: .leading) {
            Text(category.name).foregroundColor(.white)
            Text("￥\(String(format: "%.2f", category.amount))").font(.title).foregroundColor(.white)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
