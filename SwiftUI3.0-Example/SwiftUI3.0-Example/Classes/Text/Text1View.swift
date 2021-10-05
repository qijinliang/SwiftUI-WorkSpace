//
//  Text1View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Text1View: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                
                VStack() {
                    Text("文本描述内容，可以自动换行\n测试\n换行")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                //            .background(Color.green)
                //MARK: 扩展SwfitUI颜色写法
                .background(Color(hex: "#FF6D5D"))
                
                Text("这里可以使用.lineLimit(1)方法表示后面表示....")
                    .font(.title)
                //MARK: 显示多少行
                    .lineLimit(1)
                    .padding(.horizontal)
            }
        }
        .navigationTitle("字体")
    }
}

struct Text1View_Previews: PreviewProvider {
    static var previews: some View {
        Text1View()
    }
}
