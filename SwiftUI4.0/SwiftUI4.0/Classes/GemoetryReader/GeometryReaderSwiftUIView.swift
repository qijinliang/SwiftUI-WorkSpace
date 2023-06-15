//
//  GemoetryReaderSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/20.
//

import SwiftUI

struct GeometryReaderSwiftUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("GemoetryReader")
                .font(.largeTitle)
                .foregroundColor(.black)
            
            Text("Introducation")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("GemometryReader is a container view that pushes out to fill up all available spce. You use it to help with positioning items within it.")
                .font(.title)
            
            GeometryReader() { geometry in
                
            }.background(Color.pink)
        }
    }
}

struct GeometryReaderSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderSwiftUIView()
    }
}
