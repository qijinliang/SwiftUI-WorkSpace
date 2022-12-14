//
//  ChangeShow.swift
//  SwiftUI2.0-Example
//
//  Created by 金亮 on 2021/9/8.
//

import SwiftUI

struct ChangeShow: View {
    @State private var Show = false
    var body: some View {
        VStack(spacing: 30) {
            Text("点击显示或者隐藏视图")
                .font(.system(size: 30))
            
            Button.init(action: {
                self.Show.toggle()
            }, label: {
                Text(self.Show ? "隐藏" : "显示")
                    .padding()
                    .foregroundColor(self.Show ? Color.blue : Color.red)
            })
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                .padding()
                //MARK: 这里才是设置是否显示或者的关键方法
                .opacity(Show ? 1 : 0)
                .animation(.easeInOut, value: Show)
        }
    }
}

struct ChangeShow_Previews: PreviewProvider {
    static var previews: some View {
        ChangeShow()
    }
}
