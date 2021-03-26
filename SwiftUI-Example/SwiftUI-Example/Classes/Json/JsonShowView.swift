//
//  JsonShowView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/26.
//

import SwiftUI

struct JsonShowView: View {
    var body: some View {
        Form {
            Section(header: Text("Json").font(.title3).fontWeight(.heavy)) {
                NavigationLink(destination: JsonSwiftUIView()) {
                    Text("Json")
                }
                
                NavigationLink(destination: Json2SwiftUIView()) {
                    Text("Json2")
                }
                
                NavigationLink(destination: Json3SwiftUIView()) {
                    Text("Json3")
                }
            }
        }
    }
}

struct JsonShowView_Previews: PreviewProvider {
    static var previews: some View {
        JsonShowView()
    }
}
