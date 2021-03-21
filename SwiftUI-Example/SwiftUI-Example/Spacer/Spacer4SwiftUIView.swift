//
//  Spacer4SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/20.
//

import SwiftUI

struct Spacer4SwiftUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Spacer")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text("Relative Spacing")
                .font(.largeTitle)
                .foregroundColor(.gray)
            
            VStack() {
                Text("You can add more spacers to create relative spacing in comparision to other spacers.")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(#colorLiteral(red: 0.9965897202, green: 0.8405602574, blue: 0.02881385945, alpha: 1)))
            HStack(){
                VStack(spacing: 5) {
                    Spacer().frame(width: 5)
                        .background(Color.blue)
                    Text("33% Dowm")
                        .font(.title)
                    Spacer().frame(width: 5)
                        .background(Color.blue)
                    Spacer().frame(width: 5)
                        .background(Color.blue)
                }
                
                VStack(spacing: 5) {
                    Spacer().frame(width: 5)
                        .background(Color.blue)
                    Spacer().frame(width: 5)
                        .background(Color.blue)
                    Spacer().frame(width: 5)
                        .background(Color.blue)
                    Text("75% Dowm")
                        .font(.title)
                    Spacer().frame(width: 5)
                        .background(Color.blue)
                }
            }
        }
    }
}

struct Spacer4SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Spacer4SwiftUIView().preferredColorScheme(.dark)
    }
}
