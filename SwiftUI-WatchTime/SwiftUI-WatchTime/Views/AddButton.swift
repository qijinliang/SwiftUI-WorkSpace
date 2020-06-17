//
//  AddButton.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct AddButton: View {
    
    @Binding var isExpanded: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                self.isExpanded.toggle()
            }
        }) {
            Image(systemName: "plus")
            .padding()
                .background(isExpanded ? Color.white : Color.clear)
                .foregroundColor(isExpanded ? Color.black : Color.white)
                .cornerRadius(isExpanded ? 25 : 0)
                .rotationEffect(Angle(degrees: isExpanded ? 45 : 90), anchor: .center)
        }.offset(x: isExpanded ? 0 : UIScreen.main.bounds.width / 3, y: -50)
    }
}
