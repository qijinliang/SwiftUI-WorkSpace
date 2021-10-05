//
//  Text3View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Text3View: View {
    var body: some View {
        VStack(spacing: 20) {
            ScrollView(showsIndicators: false) {
                HStack() {
                    Text("可以设置文本粗体方法.fontWeight(.xxxx)")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    VStack() {
                        Text("可以添加系统自带的SF符号")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(.white)
                        Image.init(systemName: "w.square.fill")
                            .font(.system(size: 40))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                Group() {
                    Text("Font.ultraLight")
                        .fontWeight(.ultraLight)
                    Text("Font.thin")
                        .fontWeight(.thin)
                    Text("Font.light")
                        .fontWeight(.light)
                    Text("Font.regular")
                        .fontWeight(.regular)
                    Text("Font.medium")
                        .fontWeight(.medium)
                    Text("Font.semibold")
                        .fontWeight(.semibold)
                    Text("Font.bold")
                        .fontWeight(.bold)
                    Text("Font.heavy")
                        .fontWeight(.heavy)
                    Text("Font.black")
                        .fontWeight(.black)
                }.font(.largeTitle)
            }
        }
        .navigationTitle("文本粗体")
    }
}

struct Text3View_Previews: PreviewProvider {
    static var previews: some View {
        Text3View()
    }
}
