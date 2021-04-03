//
//  Button6View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Button6View: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Button")
                .font(.largeTitle)
            Text("With SF Symbols")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack() {
                Text("Buttons can be composed with SF Symbols too.")
                    .font(.title)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.purple)
            
            Button(action: {
                
            }){
                Text("Button With Symbol")
                    .padding(.horizontal)
                Image.init(systemName: "gift.fill")
            }.padding()
            .font(.title)
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button(action: {
                
            }){
                Image.init(systemName: "magnifyingglass")
                Text("Search")
            }
            .padding()
            .font(.title)
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button(action: {
                
            }){
                VStack() {
                    Image.init(systemName: "video.fill")
                    Text("Record")
                        .padding(.horizontal)
                }
            }
            .padding()
            .font(.title)
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(60.0)
        }
    }
}

struct Button6View_Previews: PreviewProvider {
    static var previews: some View {
        Button6View().preferredColorScheme(.dark)
    }
}
