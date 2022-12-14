//
//  HStack5SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/21.
//

import SwiftUI

struct HStack5SwiftUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("HStack")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text("First&Last Text Alignment")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack() {
                Text("The firstTextBaseline will align the bottom of the text on the first line(Amazing and Relly)")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            
            HStack(alignment: .firstTextBaseline) {
                VStack() {
                    Text("Amazing")
                    Text("developer")
                }
                
                VStack(alignment: .leading) {
                    Text("Really")
                    Text("amazing")
                    Text("developer")
                }
                .font(.title)
            }
            
            VStack() {
                Text("The lastTextBaseline will align the bottom of the text on the first line(developer and developer)")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            
            HStack(alignment: .lastTextBaseline) {
                VStack() {
                    Text("Amazing")
                    Text("developer")
                }
                
                VStack(alignment: .leading) {
                    Text("Really")
                    Text("amazing")
                    Text("developer")
                }
                .font(.title)
            }
        }
    }
}

struct HStack5SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HStack5SwiftUIView().preferredColorScheme(.dark)
    }
}
