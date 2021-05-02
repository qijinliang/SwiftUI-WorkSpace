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
                Section(header: Text("Section1").font(.title3).fontWeight(.heavy)) {
                    VStackMainView()
                    //MARK: Navigation
                    NavigationShowView()
                    //MARK: Text
                    TextMainView()
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
                    //MARK: Map
                    MapMainView()
                }
                Section(header: Text("Section2").font(.title3).fontWeight(.heavy)) {
                    //MARK: Layout
                    LayoutMainView()
                    //MARK: Segmented
                    SegmentedMainView()
                    //MARK: Slider
                    SliderMainView()
                    //MARK: TextField
                    TextFieldMainView()
                }
                
                Section(header: Text("Section3").font(.title3).fontWeight(.heavy)) {
                    //MARK: Math
                    MathMainView()
                    //MARK: Gesture
                    GestureMainView()
                    //MARK: GemoetryReader
                    GemoetryReaderMainView()
                    //MARK: Json
                    JsonMainView()
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
