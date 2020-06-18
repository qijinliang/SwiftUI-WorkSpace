//
//  LCButton.swift
//  SwiftUI-GuideLogin
//
//  Created by qjinliang on 2020/6/18.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct LCButton: View {
    
    var text = "Next"
    var action: (()->()) = {}
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                Text(text)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical)
                    .accentColor(Color.white)
                .background(Color("accentColor"))
                .cornerRadius(30)
            }
        }
    }
}

struct LCButton_Previews: PreviewProvider {
    static var previews: some View {
        LCButton()
    }
}
