//
//  ToolbarButton.swift
//  SwiftUI-WikiApp
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//


import SwiftUI

struct ToolbarButton: View{
    
    var icon = "bubble.left"
    var isSelected = false
    var isPlus = false
    var action: (()->()) = {}

    
    var body: some View{
        let selectedColor = "orange"
        
        return Button(action: {
            self.action()
        }) {
            HStack {
                Image(systemName: self.icon)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor( isPlus ? Color.white : isSelected ? Color(selectedColor) : Color.gray)
                
            }.padding(10)
                .background(isPlus ? Color("green") : isSelected ? Color(selectedColor).opacity(0.2) : Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
    }
}


struct ToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarButton()
    }
}
