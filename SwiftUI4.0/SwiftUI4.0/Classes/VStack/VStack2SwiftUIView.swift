//
//  VStack2SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/10.
//

import SwiftUI

struct VStack2SwiftUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            HeadView(title: "自定义传值",subtitle: "标题说明",textColor: UIColor.white,Desc: "可以封装自定义视图，进行简单的传值使用")
            
            VStack {
                Text("Divider画线")
                Divider()
                Text("Divider画线")
                Divider()
                Text("Divider画线")
            }
            //字体相对蓝色区域的调整
            .padding()
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.blue))
            .font(.title)
            //蓝色区域相对父视图的调整
            .padding()
        }
    }
}


//MARK: 自定义视图传参数
struct HeadView: View {
    
    @State var title = ""
    @State var subtitle = ""
    @State var textColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
    
    
    @State var Desc = ""
    var body: some View {
        Text(title)
            .font(.largeTitle)
        Text(subtitle)
            .font(.title)
            .foregroundColor(Color.gray)
        
        VStack() {
            Text(Desc)
                .font(.title)
                .foregroundColor(Color(textColor))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blue)
    }
}

struct VStack2SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack2SwiftUIView()
    }
}
