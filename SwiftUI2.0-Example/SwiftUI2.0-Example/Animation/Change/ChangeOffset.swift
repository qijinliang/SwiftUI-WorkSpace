//
//  ChangeOffset.swift
//  SwiftUI2.0-Example
//
//  Created by Cheney on 2021/9/7.
//

import SwiftUI

struct ChangeOffset: View {
    
    @State private var Change = false
    
    var body: some View {
        VStack() {
            
            VStack(spacing: 20) {
                Text("点击移动正方形位置")
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Change ? .red : .blue)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .offset(x: Change ? 140 : -140, y: 0)
                .animation(.easeOut)
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Change ? .red : .blue)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .offset(x: -140, y: Change ? 120 : 0)
                .animation(.easeOut)
            Spacer()
            Button("点击移动位置") {
                self.Change.toggle()
            }
        }
    }
}

struct ChangeOffset_Previews: PreviewProvider {
    static var previews: some View {
        ChangeOffset()
    }
}
