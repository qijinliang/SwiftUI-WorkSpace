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
                //MARK: View
                Section(header: Text("View").font(.title3).fontWeight(.heavy)) {
                    VStackMainView()
                }
                //MARK: Navigation
                Section(header: Text("Navigation").font(.title3).fontWeight(.heavy)) {
                    NavigationShowView()
                }
                //MARK: Json
                Section(header: Text("Json").font(.title3).fontWeight(.heavy)) {
                    JsonMainView()
                }
                //MARK: Animation
                Section(header: Text("Animation").font(.title3).fontWeight(.heavy)) {
                    AnimationMainView()
                }
                //MARK: Math
                Section(header: Text("Math").font(.title3).fontWeight(.heavy)) {
                    MathMainView()
                }
                //MARK: Gesture
                Section(header: Text("Gesture").font(.title3).fontWeight(.heavy)) {
                    GestureMainView()
                }
                //MARK: Button
                Section(header: Text("Button").font(.title3).fontWeight(.heavy)) {
                    ButtonMainView()
                }
                //MARK: ScrollView
                Section(header: Text("ScrollView").font(.title3).fontWeight(.heavy)) {
                    ScrollMainView()
                }
                //MARK: GemoetryReader
                Section(header: Text("GemoetryReader").font(.title3).fontWeight(.heavy)) {
                    GemoetryReaderMainView()
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
