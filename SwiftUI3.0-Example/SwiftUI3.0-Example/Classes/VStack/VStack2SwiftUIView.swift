//
//  VStack2SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/10.
//

import SwiftUI

struct VStack2SwiftUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            HeadView(title: "VStack",subtitle: "Nesting",textColor: UIColor.white,Desc: "A VStack can be nested with in another VStack when laying out views.")
            
            VStack {
                Text("VStack inside another VStack")
                Divider()
                Text("This can be helpful. Why")
                Divider()
                Text("More than 10 veiws creates an error.")
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
