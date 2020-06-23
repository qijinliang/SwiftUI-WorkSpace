//
//  LCTextfield.swift
//  SwiftUI-GuideLogin
//
//  Created by qjinliang on 2020/6/22.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct LCTextfield: View {
    
    @Binding var value: String
    var placeholder = "Placeholder"
    var icon = Image(systemName: "person.crop.circle")
    var color = Color("offColor")
    var isSecure = false
    var onEditingChanged: ((Bool)->()) = {_ in }
    
    var body: some View {
        HStack {
            if isSecure {
                SecureField(placeholder, text: self.$value, onCommit: {
                    self.onEditingChanged(false)
                }).padding()
            } else {
                TextField(placeholder, text: self.$value, onEditingChanged: { flag in
                    self.onEditingChanged(flag)
                }).padding()
            }
            
            icon.imageScale(.large)
            .padding()
            .foregroundColor(color)
        }.background(color.opacity(0.2).clipShape(Capsule()))
    }
}

struct LCTextfield_Previews: PreviewProvider {
    static var previews: some View {
        LCTextfield(value: .constant(""))
    }
}
