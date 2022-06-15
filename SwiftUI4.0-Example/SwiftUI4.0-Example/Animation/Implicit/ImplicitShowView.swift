//
//  ImplicitShowView.swift
//  SwiftUI3.0-Example
//
//  Created by Cheney on 2021/9/26.
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
                    Text("圆形动态加载")
                }
                
                NavigationLink(destination: Implicit3()) {
                    Text("进度条loading动画")
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
