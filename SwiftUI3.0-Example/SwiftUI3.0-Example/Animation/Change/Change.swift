//
//  Move1.swift
//  SwiftUI2.0-Example
//
//  Created by Cheney on 2021/9/6.
//

import SwiftUI

struct Change: View {
    
    @State private var changes = false
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
            
            Text("点击按钮Change，对圆形进行上下移动")
                .padding()
                .font(.title)
                .foregroundColor(Color(hex: "#FF6D5D"))
            
            
            Circle()
                .foregroundColor(.orange)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                //这里是变量，用来控制y的坐标，从而改变圆形的位置
                .offset(x: 0, y: changes ? 300 : 0)
                //这里加上动画的效果，更让圆形显示效果为下滑，从而不是瞬移
                .animation(Animation.easeInOut, value: changes)
            Spacer()
            
            Button("圆形下滑") {
                self.changes.toggle()
            }
            .padding(.bottom)
        }
    }
}

struct Move1_Previews: PreviewProvider {
    static var previews: some View {
        Change()
    }
}
