//
//  Button7View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Button7View: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Button")
                .font(.largeTitle)
            Text("With Images")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack() {
                Text("Buttons word fine with the SF Symbols. But what if you wanted to use a photo? Look what happens:")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.purple)
            
            Button(action: {}){
                RoundedRectangle(cornerRadius: 40.0)
                    .frame(width: 250, height: 80, alignment: .center)
            }
            
            VStack() {
                Text("This is because the image rendering mode is set to \"template\" by default. This means all non-transparent areas will use the accent color. You need to change the rendering mode to fix this.")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.purple)
            
            Button(action: {
                
            }){
                Image.init("未来的人5")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 70, alignment: .center)
                    .cornerRadius(50)
            }
        }
    }
}

struct Button7View_Previews: PreviewProvider {
    static var previews: some View {
        Button7View().preferredColorScheme(.dark)
    }
}
