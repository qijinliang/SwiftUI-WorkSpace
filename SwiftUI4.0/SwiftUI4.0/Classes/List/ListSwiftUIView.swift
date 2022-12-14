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
                Section(header: Text("第一部分").font(.title3).fontWeight(.heavy)) {
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
                Section(header: Text("第二部分").font(.title3).fontWeight(.heavy)) {
                    //MARK: Layout
                    LayoutMainView()
                    //MARK: Segmented
                    SegmentedMainView()
                    //MARK: Slider
                    SliderMainView()
                    //MARK: TextField
                    TextFieldMainView()
                    //MARK: Sheet
                    SheetMainView()
                    //MARK: Dynamic Island
                    DynamicIslandMainView()
                }
                
                Section(header: Text("第三部分").font(.title3).fontWeight(.heavy)) {
                    //MARK: Math
                    MathMainView()
                    //MARK: Gesture
                    GestureMainView()
                    //MARK: GemoetryReader
                    GemoetryReaderMainView()
                    //MARK: Json
                    JsonMainView()
                    //MARK: AVPlayer
                    AVPlayerMainView()
                    //MARK: ChartsMainView
                    ChartsMainView()
                }
                
                
                Section(header: Text("值绑定").font(.title3).fontWeight(.heavy)) {
                    //MARK: Binding
                    BingdingMainView()

                }
            }
            
            .navigationBarTitle("SwiftUI示例",displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
struct ListSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ListSwiftUIView().preferredColorScheme(.dark)
    }
}
