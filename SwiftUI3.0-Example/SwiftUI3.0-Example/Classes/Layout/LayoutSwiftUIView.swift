//
//  LayoutSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/17.
//

import SwiftUI

struct LayoutSwiftUIView: View {
    var body: some View {
        VStack(spacing: 20){
            Text("Lagout Behavior")
                .font(.largeTitle)
            Text("Views that Pull In")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack(){
                Text("Some Views minimize their frame size so it is only as big as the content within it")
                    .font(.title)
            }
            .padding()
            .frame(maxWidth: .infinity)
            //MARK: - 颜色写法.background(Color(ColorLiteral))
            .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
            Image(systemName: "arrow.down.to.line.alt")
            HStack(){
                Image(systemName: "arrow.right.to.line.alt")
                Text("Text Views pull in")
                    .font(.system(size: 25))
                Image(systemName: "arrow.left.to.line.alt")
            }
            Image(systemName: "arrow.up.to.line.alt")
            
            VStack(){
                Text("Pull-In views tend to center themeselves within their parent container view.")
                    .font(.title)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.purple)
        }
        .foregroundColor(.white)
    }
}

struct LayoutSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //MARK: 默认竖屏
            LayoutSwiftUIView().preferredColorScheme(.dark)
            LayoutSwiftUIView().preferredColorScheme(.dark)
                //MARK: 横屏设置
                .previewLayout(PreviewLayout.fixed(width: 900, height: 450))
        }
    }
}
