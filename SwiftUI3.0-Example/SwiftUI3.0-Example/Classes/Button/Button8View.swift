//
//  Button8View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Button8View: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Button")
                .font(.largeTitle)
            Text("Floating")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack() {
                Text("You can also create floating buttons by using a ZStack so the button on the top layer,over everything else")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.purple)
            Spacer()
            HStack() {
                Spacer()
                Button(action: {
                    
                }){
                    Image.init(systemName: "plus")
                        .font(.largeTitle)
                }
                .padding(20)
                .foregroundColor(Color.white)
                .background(Color.purple)
                .cornerRadius(40)
            }.padding(30)
        }
    }
}

struct Button8View_Previews: PreviewProvider {
    static var previews: some View {
        Button8View().previewLayout(.device).preferredColorScheme(.dark)
    }
}
