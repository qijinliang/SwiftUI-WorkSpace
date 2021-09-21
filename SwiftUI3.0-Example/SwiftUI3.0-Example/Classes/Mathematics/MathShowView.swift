//
//  MathShowView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/26.
//

import SwiftUI

struct MathShowView: View {
    var body: some View {
        Form() {
            Section {
                NavigationLink(destination: LineGraphSwiftUIView()){
                    Text("LineGraph")
                }
                
                NavigationLink(destination: FanshapedSwiftUIView(show: .constant(true))){
                    Text("Fanshaped")
                }
                
                NavigationLink(destination: Chart_SwiftUIView()){
                    Text("Chart")
                }
                
                NavigationLink(destination: RectangleSwiftUIView()){
                    Text("Rectangle")
                }
            }
        }
    }
}

struct MathShowView_Previews: PreviewProvider {
    static var previews: some View {
        MathShowView()
    }
}
