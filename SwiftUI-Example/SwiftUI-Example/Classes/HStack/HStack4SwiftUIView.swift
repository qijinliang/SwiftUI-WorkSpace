 //
 //  HStack4SwiftUIView.swift
 //  SwiftUI-Example
 //
 //  Created by Cheney on 2021/3/17.
 //
 
 import SwiftUI
 
 struct HStack4SwiftUIView: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("HStack")
                .font(.largeTitle)
                .foregroundColor(.white)
            Text("Text Alignemnt")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack(){
                Text("HStack have anther alignemnt optons to help better align the bottom of text")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            
            HStack(alignment: .bottom) {
                Text("Hello")
                Text("amzzing")
                    .font(.largeTitle)
                Text("developer!")
            }
            
            VStack(){
                Text("Notic the bottom of the next isn't really aligned above.Use firstTextBaseline or lastTextBaseline instead.")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            
            HStack(alignment: .firstTextBaseline) {
                Text("Hello")
                Text("amzzing")
                    .font(.largeTitle)
                Text("developer!")
            }
        }
    }
 }
 
 struct HStack4SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HStack4SwiftUIView().preferredColorScheme(.dark)
    }
 }
