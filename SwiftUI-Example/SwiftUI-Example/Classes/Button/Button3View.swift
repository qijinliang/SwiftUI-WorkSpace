//
//  Button3View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Button3View: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Button")
                .font(.largeTitle)
            Text("Text Composition")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack() {
                Text("You can add more than one text view to a button. By default, the views are composed within an HStack.")
            }
            .padding()
            .font(.title)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color.purple)
            
            Button(action: {
                print("Fortgot Password? Tap to Recover")
            }) {
                Text("Fortgot Password?")
                Text("Tap to Recover")
                    .foregroundColor(.orange)
            }
            .padding()
            .font(.title2)
            
            VStack() {
                Text("Using a VStack")
            }
            .padding()
            .font(.title)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color.purple)
            
            Button(action: {
                print("New User Register Here")
            }) {
                VStack() {
                    Text("New User")
                        .font(.title)
                    Text("(Register Here)")
                        .font(.body)
                }
            }
        }
    }
}

struct Button3View_Previews: PreviewProvider {
    static var previews: some View {
        Button3View().preferredColorScheme(.dark)
    }
}
