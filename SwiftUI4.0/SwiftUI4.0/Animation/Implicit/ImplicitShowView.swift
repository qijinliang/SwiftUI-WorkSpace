//
//  ImplicitShowView.swift
//  SwiftUI3.0-Example
//
//  Created by 金亮 on 2021/9/26.
//

import SwiftUI

struct ImplicitShowView: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: Implicit1()) {
                    Text("点击❤️")
                }
                
                NavigationLink(destination: Implicit2()) {
                    Text("3D动画加载")
                }
                
                NavigationLink(destination: Implicit3()) {
                    Text("多个按钮动画")
                }
                
                NavigationLink(destination: Implicit4()) {
                    Text("消息加载动画")
                }
                
                NavigationLink(destination: Implicit5()) {
                    Text("时钟动画")
                }
            }
        }
    }
}

struct ImplicitShowView_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitShowView()
    }
}
