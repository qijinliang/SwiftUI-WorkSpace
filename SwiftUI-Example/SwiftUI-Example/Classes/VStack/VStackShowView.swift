//
//  VStackShowSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/26.
//

import SwiftUI

struct VStackShowView: View {
    var body: some View {
        
        Form() {
            Section {
                NavigationLink(destination: VStackSwiftUIView()) {
                    Text("VStack1")
                        .font(.title3)
                        .fontWeight(.heavy)
                }
                
                NavigationLink(destination: VStack2SwiftUIView()) {
                    Text("VStack2")
                        .font(.title3)
                        .fontWeight(.heavy)
                }
            }
            Section {
                NavigationLink(destination: VStack3SwiftUIView()) {
                    Text("VStack3")
                        .font(.title3)
                        .fontWeight(.heavy)
                }
                
                NavigationLink(destination: VStack4SwiftUIView()) {
                    Text("VStack4")
                        .font(.title3)
                        .fontWeight(.heavy)
                }
                
            }
        }
    }
}

struct VStackShowSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStackShowView()
    }
}
