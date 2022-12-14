//
//  Button9View.swift
//  SwiftUI2.0-Example
//
//  Created by 金亮 on 2021/8/10.
//

import SwiftUI
import AuthenticationServices// 一定要导入
struct Button9View: View {
    @State private var message: String = "多行文本输入框"
    var body: some View {
        VStack{
            SignInWithAppleButton(.signIn) { request in
                request.requestedScopes = [.fullName,.email]//授权时显示的内容
            } onCompletion: { result in
                switch result{
                case .success(let success):
                    print(success)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

struct Button9View_Previews: PreviewProvider {
    static var previews: some View {
        Button9View().preferredColorScheme(.dark)
    }
}

