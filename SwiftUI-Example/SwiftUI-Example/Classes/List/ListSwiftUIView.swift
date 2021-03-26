//
//  ListSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/25.
//

import SwiftUI

struct ListSwiftUIView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("View").font(.title3).fontWeight(.heavy)) {
                    VStackMainView()
                }
                
                Section(header: Text("Navigation").font(.title3).fontWeight(.heavy)) {
                    NavigationShowView()
                }
                
                Section(header: Text("Json").font(.title3).fontWeight(.heavy)) {
                    JsonMainView()
                }
                
                Section(header: Text("Animation").font(.title3).fontWeight(.heavy)) {
                    AnimationMainView()
                }
            }
            
            .navigationBarTitle("SwiftUI示例",displayMode: .inline)
        }
    }
}
struct ListSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ListSwiftUIView()
    }
}
