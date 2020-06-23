//
//  RecoverPasswordView.swift
//  SwiftUI-GuideLogin
//
//  Created by qjinliang on 2020/6/22.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct RecoverPasswordView: View {
    
    @State private var emial = ""
    @Binding var presentPasswordRecoverySheet: Bool
    
    var body: some View {
        VStack(spacing: 40) {
            Image("Logo")
            Text("恢复密码").font(.title).bold()
            VStack {
                LCTextfield(value: self.$emial, placeholder: "邮箱", icon: Image(systemName: "at"))
                LCButton(text: "重置密码") {}
            }
            
            Button(action: {
                self.presentPasswordRecoverySheet.toggle()
            }) {
                HStack {
                    Text("取消").accentColor(Color.accentColor)
                }
            }
        }.padding()
    }
}

struct RecoverPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        RecoverPasswordView(presentPasswordRecoverySheet: .constant(false))
    }
}
