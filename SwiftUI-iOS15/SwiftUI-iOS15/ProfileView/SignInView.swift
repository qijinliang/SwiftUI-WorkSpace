//
//  SwiftUIView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/15.
//

import SwiftUI

struct SignInView: View {
    enum Field: Hashable {
        case email
        case password
    }
    
    @State var email = ""
    @State var password = ""
    @FocusState var focusedField: Field?
    @State var circleY: CGFloat = 0
    @State var emailY: CGFloat = 0
    @State var passwordY: CGFloat = 0
    @State var circleColor: Color = .blue
    @EnvironmentObject var model: Model
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("登录")
                .font(.largeTitle).bold()
            Text("学习更多的SwiftUI资料")
                .font(.headline)
            TextField("邮件", text: $email)
                .inputStyle(icon: "mail")
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .focused($focusedField, equals: .email)
                .shadow(color: focusedField == .email ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                .overlay(geometry)
                .onPreferenceChange(CirclePreferenceKey.self) { value in
                    emailY = value
                    circleY = value
                }
            SecureField("密码", text: $password)
                .inputStyle(icon: "lock")
                .textContentType(.password)
                .focused($focusedField, equals: .password)
                .shadow(color: focusedField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                .overlay(geometry)
                .onPreferenceChange(CirclePreferenceKey.self) { value in
                    passwordY =  value
                }
            Button {} label: {
                Text("登录")
                    .frame(maxWidth: .infinity)
            }
            .font(.headline)
            .blendMode(.overlay)
            .buttonStyle(.angular)
            .tint(.accentColor)
            .controlSize(.large)
            .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
            
            Group {
                
                Divider()
                
                HStack {
                    Text("没有账号?")
                    Button {
                        model.selectedModal = .signUp
                    } label: {
                        Text("**注册**")
                    }
                }
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            .accentColor(.secondary)
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .background(
            Circle().fill(circleColor)
                .frame(width: 68, height: 68)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(y: circleY)
        )
        .coordinateSpace(name: "container")
        .strokeStyle(cornerRadius: 30)
        .onChange(of: focusedField) { value in
            withAnimation {
                if value == .email {
                    circleY = emailY
                    circleColor = .blue
                } else {
                    circleY = passwordY
                    circleColor = .red
                }
            }
        }
    }
    
    var geometry: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: CirclePreferenceKey.self, value: proxy.frame(in: .named("container")).minY)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SignInView()
                .environmentObject(Model())
        }
    }
}
