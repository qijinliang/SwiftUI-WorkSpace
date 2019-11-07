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
                Button(action: {
                    
                }, label: {
                    Text("Hello World").modifier(CustomModifier())
                    
                })
                
                Button(action: {
                    
                }, label: {
                    Text("More Details").modifier(CustomModifier(fontSize: 8, backgroundColor: .green))
                    
                })
                
                Button(action: {
                    
                }, label: {
                Text("Cancle")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(Color.red)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                        .strokeBorder(style: StrokeStyle(lineWidth: 1))
                            .foregroundColor(Color(.sRGB, red: 0.1,green: 0.1,blue: 0.1,opacity: 1)))
                        .cornerRadius(4)
                        .shadow(color: .init(.sRGB, red: 0,green: 0,blue: 0,opacity: 0.5), radius: 5, x: 0, y: 0)
                    
                    
                })
            }
        }
    }
}

struct CustomModifier: ViewModifier {
    
    @State var fontSize: CGFloat = 16
    @State var backgroundColor = Color.blue
    
    func body(content: Content) -> some View {
        
        return content
            .foregroundColor(.white)
           .font(.system(size: fontSize))
           .padding(.horizontal, 14)
           .padding(.vertical, 10)
           .background(backgroundColor)
           .overlay(
               RoundedRectangle(cornerRadius: 3)
               .strokeBorder(style: StrokeStyle(lineWidth: 1))
                   .foregroundColor(Color(.sRGB, red: 0.1,green: 0.1,blue: 0.1,opacity: 1)))
               .cornerRadius(4)
               .shadow(color: .init(.sRGB, red: 0,green: 0,blue: 0,opacity: 0.5), radius: 5, x: 0, y: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
