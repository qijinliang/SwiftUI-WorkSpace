//
//  VStackShowSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/26.
//

import SwiftUI

struct VStackShowView: View {
    var body: some View {
        
        Form() {
            //MARK: VStack
            Section(header: Text("VStack").font(.title3).fontWeight(.heavy)) {
                NavigationLink(destination: VStackSwiftUIView()) {
                    Text("VStack1")
                }
                
                NavigationLink(destination: VStack2SwiftUIView()) {
                    Text("VStack2")
                }
                
                NavigationLink(destination: VStack3SwiftUIView()) {
                    Text("VStack3")
                }
                
                NavigationLink(destination: VStack4SwiftUIView()) {
                    Text("VStack4")
                }
            }
            //MARK: HStack
            Section(header: Text("HStack").font(.title3).fontWeight(.heavy)) {
                NavigationLink(destination: HStackSwiftUIView()) {
                    Text("HStack1")
                }
                
                NavigationLink(destination: HStack2SwiftUIView()) {
                    Text("HStack2")
                }
                
                NavigationLink(destination: HStack3SwiftUIView()) {
                    Text("HStack3")
                }
                
                NavigationLink(destination: HStack4SwiftUIView()) {
                    Text("HStack4")
                }
                
                NavigationLink(destination: HStack5SwiftUIView()) {
                    Text("HStack5")
                }
                
                NavigationLink(destination: HStack6SwiftUIView()) {
                    Text("HStack6")
                }
                
                NavigationLink(destination: HStack7View()) {
                    Text("HStack7")
                }
            }
            
            //MARK: ZStack
            Section(header: Text("ZStack").font(.title3).fontWeight(.heavy)) {
                NavigationLink(destination: ZStackSwiftUIView()) {
                    Text("ZStack")
                }

                NavigationLink(destination: ZStack2SwiftUIView()) {
                    Text("ZStack2")
                }
                
                NavigationLink(destination: ZStack3View()) {
                    Text("ZStack3")
                }
                
                
                NavigationLink(destination: ZStack5SwiftUIView()) {
                    Text("ZStack5")
                }
            }
            
            
            //MARK: LazyHGrid
            Section(header: Text("LazyHGrid").font(.title3).fontWeight(.heavy)) {
                NavigationLink(destination: LazyHGridView()) {
                    Text("LazyHGridView")
                }
                
                NavigationLink(destination: LazyHGridView2()) {
                    Text("LazyHGridView2")
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
