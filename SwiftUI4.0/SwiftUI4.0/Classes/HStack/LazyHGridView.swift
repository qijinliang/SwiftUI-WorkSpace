//
//  LazyHGridView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/5/14.
//

import SwiftUI

struct LazyHGridView: View {
    var body: some View {
        VStack(spacing: 20) {
            //MARK: iOS 14 推出的 SwiftUI LazyVGrid 和 LazyHGrid
            LazyHGrid(rows: rows) {
                Group{
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!Hello, World!")
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
                .shadow(radius: 10)
                .cornerRadius(10)
            }
        }
    }
    
    var rows: [GridItem] = [
        GridItem(.flexible(minimum: 10, maximum: 100)),
        GridItem(.flexible(minimum: 10, maximum: 100)),
        GridItem(.flexible(minimum: 10, maximum: 100)),
        GridItem(.flexible(minimum: 10, maximum: 100)),
        GridItem(.flexible(minimum: 10, maximum: 100))
    ]
}

struct LazyHGridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridView()
    }
}
