//
//  ChangeAngle.swift
//  SwiftUI2.0-Example
//
//  Created by Cheney on 2021/9/8.
//

import SwiftUI

struct ChangeAngle: View {
    
    @State private var Change = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("正方形旋转")
                .font(.title)
                .fontWeight(.bold)
            
            Button.init(action: {
                self.Change.toggle()
            }, label: {
                Text("点击")
                    .font(.title2)
            })
            
            VStack() {
                
                HStack() {
                    RoundedRectangle(cornerRadius: 10)
                        .padding()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .overlay(Image(systemName: "arrow.right")).font(.system(size: 40))
                        .rotationEffect(Angle.degrees(Change ? 40 : 0),anchor: .topLeading)
                        .animation(.easeInOut, value: Change)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .padding()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .overlay(Image(systemName: "arrow.left")).font(.system(size: 40))
                        .rotationEffect(Angle.degrees(Change ? -40 : 0),anchor: .topTrailing)
                        .animation(.easeInOut, value: Change)
                }
                HStack() {
                    RoundedRectangle(cornerRadius: 10)
                        .padding()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .overlay(Image(systemName: "arrow.right")).font(.system(size: 40))
                        .rotationEffect(Angle.degrees(Change ? -40 : 0),anchor: .bottomLeading)
                        .animation(.easeInOut, value: Change)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .padding()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .overlay(Image(systemName: "arrow.left")).font(.system(size: 40))
                        .rotationEffect(Angle.degrees(Change ? 40 : 0),anchor: .bottomTrailing)
                        .animation(.easeInOut, value: Change)
                }
            }
            
        }
    }
}

struct ChangeAngle_Previews: PreviewProvider {
    static var previews: some View {
        ChangeAngle()
    }
}
