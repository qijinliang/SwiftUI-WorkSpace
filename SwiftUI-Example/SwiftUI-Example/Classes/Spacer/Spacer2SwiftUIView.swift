//
//  Spacer2SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/20.
//

import SwiftUI

struct Spacer2SwiftUIView: View {
    var body: some View {
        VStack(spacing: 20){
            Text("Spacer")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text("Evenly Spaced")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack(){
                Text("Use Spacer to evenly space views horizontally so they look good on any device")
                    .font(.title)
            }
            .padding()
            .frame(maxWidth: .infinity,minHeight: 80)
            .background(Color(#colorLiteral(red: 1, green: 0.8403585553, blue: 0.02657423913, alpha: 1)))
            .foregroundColor(.black)
            
            Text("Before")
            HStack(){
                VStack(alignment: .leading){
                    Text("Names")
                        .underline()
                    Text("Chase")
                    Text("Rodrigo")
                    Text("Makr")
                    Text("Evans")
                }
                VStack(alignment: .leading){
                    Text("Color")
                        .underline()
                    Text("Red")
                    Text("Orange")
                    Text("Green")
                    Text("Blue")
                }
            }
            
            VStack(){
                Text("After")
                    .font(.title)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(#colorLiteral(red: 1, green: 0.8403585553, blue: 0.02657423913, alpha: 1)))
            .foregroundColor(.black)
            
            HStack(){
                Spacer()
                VStack(alignment: .leading){
                    Text("Names")
                        .underline()
                    Text("Chase")
                    Text("Rodrigo")
                    Text("Makr")
                    Text("Evans")
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Color")
                        .underline()
                    Text("Red")
                    Text("Orange")
                    Text("Green")
                    Text("Blue")
                }
                Spacer()
            }
            
        }
        .font(.largeTitle)
        .foregroundColor(.white)
    }
}

struct Spacer2SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Spacer2SwiftUIView()
            .previewDevice("iPad Pro (12.9-inch) (4th generation)")
            .preferredColorScheme(.dark)
    }
}
