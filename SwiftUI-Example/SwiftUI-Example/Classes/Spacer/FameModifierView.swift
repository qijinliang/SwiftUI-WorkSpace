//
//  FameModifierView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/5/14.
//

import SwiftUI

struct FameModifierView: View {
    var body: some View {
        VStack(spacing: 20){
            Text("Hello, World!")
                .frame(maxWidth: .infinity)
                .background(Color.red)
            Text("Hello, World!")
                .background(Color.pink)
                //MARK: -为什么放在这里不能铺满颜色？
                //frame设置background修饰符，会导致VStack剩余一些空间
                //因为background修饰符是应用于Frame的视图，而不是Stack，要注意视图修饰顺序
                //.frame(maxWidth: .infinity)
        }
        .font(.system(size: 50))
        .padding()
    }
}

struct FameModifierView_Previews: PreviewProvider {
    static var previews: some View {
        FameModifierView()
    }
}
