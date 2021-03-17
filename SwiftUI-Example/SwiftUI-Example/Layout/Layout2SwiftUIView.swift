//
//  Layout2SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/17.
//

import SwiftUI

struct Layout2SwiftUIView: View {
    var body: some View {
        VStack(spacing: 20){
            Text("Layout Behavior")
                .font(.largeTitle)
            Text("Views that Push Out")
                .foregroundColor(.gray)
            
            VStack(){
                Text("Some view will push out to fill up all available space within their parent")
                    .font(.title)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
            
            Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
                .overlay(
                    VStack(alignment: .leading,spacing: 10){
                        Image.init(systemName: "arrow.up.left")
                        Text("topLeading")
                            .font(.title)
                    }
                    .padding()
                    ,alignment: .topLeading)
                .font(.largeTitle)
        }.foregroundColor(.white)
        
    }
}

struct Layout2SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Layout2SwiftUIView().preferredColorScheme(.dark)
    }
}
