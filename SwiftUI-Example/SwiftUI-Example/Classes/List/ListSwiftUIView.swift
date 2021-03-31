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
                Section(header: Text("Example").font(.title3).fontWeight(.heavy)) {
                    VStackMainView()
                    //MARK: Navigation
                    NavigationShowView()
                    //MARK: Json
                    JsonMainView()
                    //MARK: Button
                    ButtonMainView()
                    //MARK: ScrollView
                    ScrollMainView()
                    //MARK: Space
                    SpaceMainView()
                    //MARK: Form
                    FormMainView()
                    //MARK: List
                    ListMainSwiftUIView()
                    //MARK: DatePicker
                    DatePickerMainView()
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
        ListSwiftUIView().preferredColorScheme(.dark)
    }
}
