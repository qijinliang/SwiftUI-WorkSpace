//
//  Button2View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Button2View: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Button")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack(){
                Text("If you just want to show the default text style in a button then you can pass in a string as the first parameter")
                    .font(.title)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.purple)
            
            Button.init("Default Button Style", action: {
                print("Default Button Style....")
            })
            .font(.largeTitle)
            
            VStack(){
                Text("You can customize the next shown for a button.")
                    .font(.title)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.purple)
            Button(action: {
                print("Headline font....")
            }){
                Text("Headline font")
                    .font(.headline)
            }
            Divider()
            Button(action: {
                print("ForegroundColor...")
            }){
                Text("Forground Color")
                    .font(.title2)
                    .foregroundColor(Color.red)
            }
            Divider()
            Button(action: {
                
            }){
                Text("thin Font Weight")
                    .font(.title)
                    .fontWeight(.thin)
            }
        }
    }
}

struct Button2View_Previews: PreviewProvider {
    static var previews: some View {
        Button2View().preferredColorScheme(.dark)
    }
}
