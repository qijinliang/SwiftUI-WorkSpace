//
//  Button4View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Button4View: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Button")
                .font(.largeTitle)
            Text("With Borders")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack() {
                Text("Applying borders can add a nice effeect to your buttons.Here are some options.")
                    .font(.title)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.purple)
            
            Button(action: {
                
            }) {
                Text("Border Button")
                    .padding()
                    .border(Color.purple, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            }
            
            Button(action: {
                
            }) {
                Text("Border Button")
                    .padding()
                    .border(Color.purple)
                    .cornerRadius(10)
            }
            
            VStack() {
                Text("Look what happened when I tried to add a corner radius to the border. It is clipping the corners. Here is a different way you can accomplish this:")
                    .font(.title)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.purple)
            
            Button(action: {
                
            }) {
                Text("Border Button")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple,lineWidth: 1)
                    )
            }
        }
    }
}

struct Button4View_Previews: PreviewProvider {
    static var previews: some View {
        Button4View().preferredColorScheme(.dark)
    }
}
