//
//  ChangePopup.swift
//  SwiftUI3.0-Example
//
//  Created by Cheney on 2022/4/22.
//

import SwiftUI

struct ChangePopup: View {
    @State private var showPopup = true
    var body: some View {
        ZStack() {
            VStack(spacing: 20) {
                Text("自定义弹出视图").font(.title)
                VStack() {
                    Text("点击按钮时候，弹出自定义视图，可根据需求修改自定义视图样式")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                Spacer()
                
                Button("弹出自定义") {
                    self.showPopup = true
                }
            }
            .blur(radius: showPopup ? 2 : 0)
            
            if showPopup {
                
                ZStack() {
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            self.showPopup = false
                        }
                    VStack(spacing: 20) {
                        Text("弹出自定义视图")
                            .font(.subheadline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                        Spacer()
                        Text("内容说明")
                        Spacer()
                        Button("关闭自定义视图") {
                            self.showPopup = false
                        }
                        .font(.subheadline)
                        .padding(.bottom)
                    }
                }
                .frame(height: 300)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 20)
                .padding(.horizontal, 25)
            }
        }
    }
}

struct ChangePopup_Previews: PreviewProvider {
    static var previews: some View {
        ChangePopup()
    }
}
