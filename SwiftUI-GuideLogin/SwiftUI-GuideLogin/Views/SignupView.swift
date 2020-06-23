//
//  SignupView.swift
//  SwiftUI-GuideLogin
//
//  Created by qjinliang on 2020/6/22.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct SignupView: View {
    
    @State private var emial = ""
    @State private var password = ""
    @State private var confirmedPassword = ""
    
    @State private var formOffset:CGFloat = 0
    
    var body: some View {
        return VStack(spacing: 40) {
            Image("Logo")
            Text("注册").font(.title).bold()
            VStack {
                LCTextfield(value: self.$emial, placeholder: "邮箱", icon: Image(systemName: "at"), onEditingChanged: { flag in
                    withAnimation{
                        self.formOffset = flag ? -150 : 0
                    }
                })
                LCTextfield(value: self.$password, placeholder: "密码", icon: Image(systemName: "lock"), isSecure: true)
                LCTextfield(value: self.$confirmedPassword, placeholder: "确认密码", icon: Image(systemName: "lock.rotation"), isSecure: true)
                LCButton(text: "注册") {
                    
                }
            }
            
            Button(action: {
                
            }) {
                HStack{
                    Text("已经有帐户了?").accentColor(Color.accentColor)
                }
            }
        }.padding().offset(y: self.formOffset)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
