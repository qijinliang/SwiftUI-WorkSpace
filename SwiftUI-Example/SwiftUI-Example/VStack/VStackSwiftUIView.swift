//
//  VStackSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/10.
//

import SwiftUI

struct VStackSwiftUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("VStack")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack() {
                Text("A VStack will vertically arrange other views within it.")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            //用下面的方法，左右两边会留出间隙
//            .frame(width: .infinity)
            .padding()
            .background(Color.blue)
            
            //便利0~9 Text
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
