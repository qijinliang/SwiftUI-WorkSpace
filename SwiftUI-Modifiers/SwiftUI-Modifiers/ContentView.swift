//
//  ContentView.swift
//  SwiftUI-Modifiers
//
//  Created by Jerry on 2019/11/6.
//  Copyright © 2019 QijinLiang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack() {
            HStack {
                Text("Hello World")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                        .strokeBorder(style: StrokeStyle(lineWidth: 1))
                            .foregroundColor(Color(.sRGB, red: 0.1,green: 0.1,blue: 0.1,opacity: 1))
                        .cornerRadius(4)
                            .shadow(color: .init(.sRGB, red: 0,green: 0,blue: 0,opacity: 0.5), radius: 5, x: 0, y: 0)
                        )
                    }
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
