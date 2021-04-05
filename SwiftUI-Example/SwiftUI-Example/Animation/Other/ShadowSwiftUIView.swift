//
//  ShadowSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/11.
//

import SwiftUI

struct ShadowSwiftUIView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
            VStack(spacing: 8) {
                Circle()
                    .stroke(Color.blue, lineWidth: 2)
                    .frame(width: 44, height: 44)
                Text("jinliang To")
                    .font(.body).bold()
                    .foregroundColor(.black)
                Text("SwiftUI")
                    .foregroundColor(Color(#colorLiteral(red: 0.803921568627451, green: 0.803921568627451, blue: 0.803921568627451, alpha: 1.0)))
                Capsule()
                    .fill(Color.green)
                    .frame(height: 44)
                    .overlay(Text("Sign up").bold())
            }
            .padding()
            .frame(width: 300, height: 200)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        }
    }
}

struct ShadowSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ShadowSwiftUIView()
    }
}
