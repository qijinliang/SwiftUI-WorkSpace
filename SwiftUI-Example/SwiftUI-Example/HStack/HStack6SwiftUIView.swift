//
//  HStack6SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/21.
//

import SwiftUI

struct HStack6SwiftUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("HStack")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text("Customzing")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack(){
                Text("HStack are views that can have modifiers applied them just liket any other view.")
                    .foregroundColor(.black)
                    .font(.title)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            
            HStack(){
                Text("Leading Middle Trailing")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .border(Color.orange)
            
            HStack(spacing: 10){
                Image.init(systemName: "1.circle")
                Image.init(systemName: "2.circle")
                Image.init(systemName: "3.circle")
            }
            .padding()
            
            HStack(spacing: 20){
                Image.init(systemName: "a.circle.fill")
                Image.init(systemName: "b.circle.fill")
                Image.init(systemName: "c.circle.fill")
                Image.init(systemName: "d.circle.fill")
                Image.init(systemName: "e.circle.fill")
            }
            .padding()
            .font(.title)
            .background(Color.orange)
            .cornerRadius(10)
            .foregroundColor(Color.white)
        }
    }
}

struct HStack6SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HStack6SwiftUIView().preferredColorScheme(.dark)
    }
}
