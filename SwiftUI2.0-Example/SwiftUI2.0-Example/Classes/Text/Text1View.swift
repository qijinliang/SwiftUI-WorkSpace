//
//  Text1View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Text1View: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
                .foregroundColor(.black)
            Image.init(systemName: "doc.plaintext.fill")
                .font(.largeTitle)
                .foregroundColor(Color(#colorLiteral(red: 0.3967986107, green: 0.155584693, blue: 0.03261556849, alpha: 1)))
            
            VStack() {
                Text("The Text view shows read-only text that can be modified in manay ways.It wraps automatically. If you want to limit the text wrapping,add .lineLimit(<number of line here>)")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
//            .background(Color.green)
            //MARK: 扩展SwfitUI颜色写法
            .background(Color(hex: "#FF6D5D"))
            
            Text("We built the App Store to make it easy for everyone — from individuals to large teams — to distribute apps in the thriving app economy and successfully run and grow a global business.")
                .font(.title)
                //MARK: 显示多少行
                .lineLimit(1)
                .padding(.horizontal)
        }
    }
}

struct Text1View_Previews: PreviewProvider {
    static var previews: some View {
        Text1View()
    }
}
