//
//  SignUpView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/13.
//

import SwiftUI

struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("登录")
                .font(.largeTitle).bold()
            Text("查看更多的内容")
                .font(.headline)
            
            Button {} label: {
                Text("创建用户")
                    .frame(maxWidth: .infinity)
            }
            .font(.headline)
            .blendMode(.overlay)
            .buttonStyle(.angular)
            .tint(.accentColor)
            .controlSize(.large)
            
            Group {
                Text("点击")
                + Text("需要查看用户协议").foregroundColor(.primary.opacity(0.7))
                + Text("，**[禁止商业转载](https://github.com/qijinliang)**")
                
                Divider()
                
                HStack {
                    Text("有账号？")
                    Button {} label: {
                        Text("点击登录")
                    }
                }
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            .accentColor(.secondary)
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
        .padding(20)
        .background(
            Image("Blob 1").offset(x: 200, y: -100)
        )
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
