//
//  ChangeMenu.swift
//  SwiftUI3.0-Example
//
//  Created by Cheney on 2022/4/22.
//

import SwiftUI

struct ChangeMenu: View {
    @State private var showButtons = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 20) {
                Text("菜单按钮").font(.title)
                VStack() {
                    Text("当点击按钮时候，会动画弹出多个按钮")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                Spacer()
            }
            
            Group {
                Button(action: {
                    self.showButtons.toggle()
                }){
                    Image(systemName: "bag.badge.plus")
                        .padding(24)
                        .rotationEffect(Angle.degrees(showButtons ? 0 : -90))
                }
                .background(Circle().fill(Color.green).shadow(radius: 8, x: 4, y: 4))
                .offset(x: 0, y: showButtons ? -150 : 0)
                .opacity(showButtons ? 1 : 0)
                
                Button(action: {
                    self.showButtons.toggle()
                }){
                    Image(systemName: "gauge.badge.plus")
                        .padding(24)
                        .rotationEffect(Angle.degrees(showButtons ? 0 : 90))
                }
                .background(Circle().fill(Color.green).shadow(radius: 8, x: 4, y: 4))
                .offset(x: showButtons ? -110 : 0, y: showButtons ? -110 : 0)
                .opacity(showButtons ? 1 : 0)
                
                Button(action: {
                    self.showButtons.toggle()
                }){
                    Image(systemName: "calendar.badge.plus")
                        .padding(24)
                        .rotationEffect(Angle.degrees(showButtons ? 0 : 90))
                }
                .background(Circle().fill(Color.green).shadow(radius: 8, x: 4, y: 4))
                .offset(x: showButtons ? -150 : 0, y: 0)
                .opacity(showButtons ? 1 : 0)
                
                Button(action: {
                    self.showButtons.toggle()
                }) {
                    Image(systemName: "plus")
                        .padding(24)
                        .rotationEffect(Angle.degrees(showButtons ? 45 : 0))
                }
                .background(Circle().fill(Color.green).shadow(radius: 8, x: 4, y: 4))
            }
            .padding(.trailing, 20)
            .accentColor(.white)
            .animation(.default, value: showButtons)
        }
    }
}

struct ChangeMenu_Previews: PreviewProvider {
    static var previews: some View {
        ChangeMenu()
    }
}
