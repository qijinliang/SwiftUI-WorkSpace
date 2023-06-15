//
//  VStackSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/10.
//

import SwiftUI

struct VStackSwiftUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack() {
                Text("遍历")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            
            //遍历0~9 Text
            ForEach(0..<10) { foreach in
                Text("View \(foreach)")
                    .font(.title)
            }

        }
    }
}

struct VStackSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStackSwiftUIView()
    }
}
