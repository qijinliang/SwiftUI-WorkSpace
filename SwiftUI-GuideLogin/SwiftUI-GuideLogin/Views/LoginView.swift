//
//  LoginView.swift
//  SwiftUI-GuideLogin
//
//  Created by qjinliang on 2020/6/22.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State private var emial = ""
    @State private var password = ""
    @State private var formOffset: CGFloat = 0
    @State private var presentSignupSheet = false
    @State private var presentPasswordRecoverySheet = false
    
    var body: some View {
        VStack(spacing: 40) {
            Image("Logo")
            Text("登录").font(.title).bold()
            VStack {
                LCTextfield(value: self.$emial, placeholder: "邮箱", icon: Image(systemName: "at"), onEditingChanged: { flag in
                    withAnimation{
                        self.formOffset = flag ? -150 : 0
                    }
                })
                LCTextfield(value: self.$password, placeholder: "密码", icon: Image(systemName: "lock"), isSecure: true)
                LCButton(text: "登录") {
                    
                }
            }
            
            Button(action: {
                self.presentSignupSheet.toggle()
            }) {
                HStack {
                    Text("没有帐户？点击注册").accentColor(Color.accentColor)
                }
            }.sheet(isPresented: self.$presentSignupSheet) {
                SignupView()
            }
            
            Button(action: {
                    self.presentPasswordRecoverySheet.toggle()
                }) {
                    HStack {
                        Text("忘记密码？").accentColor(Color.purple)
                    }
                }.sheet(isPresented: self.$presentPasswordRecoverySheet) {
                    RecoverPasswordView(presentPasswordRecoverySheet: self.$presentPasswordRecoverySheet)
                }
        }.padding().offset(y: self.formOffset)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
