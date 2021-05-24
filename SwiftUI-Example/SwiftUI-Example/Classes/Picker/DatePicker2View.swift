//
//  DatePicker2View.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/31.
//

import SwiftUI

struct DatePicker2View: View {
    
    @State private var selection = 0
    
    var body: some View {
        VStack(spacing: 150) {
            //MARK: - 系统自带使用方法
            
            Picker(selection: $selection, label: Text("Picker")) {
                Text("First").tag(0)
                Text("Second").tag(1)
                Text("Third").tag(2)
            }.pickerStyle(SegmentedPickerStyle())
            
            /*
            //MARK: - 自定义使用
            FSPicker.init(selection: $selection) {
                Text("First").tag(0)
                Text("Second").tag(1)
                Text("Third").tag(2)
            }
                */
        }
    }
}
/*
//MARK: - 这是系统自带的Picker使用方法
//public struct Picker<Label, SelectionValue, Content> : View where Label : View, SelectionValue : Hashable, Content : View {

//MARK: - 自定义Picker使用
public struct FSPicker<SelectionValue: Hashable, Content: View>: View {
    @Namespace var ns
    @Binding var selection: SelectionValue
    @ViewBuilder let content: Content
    
    public var body: some View {
        let contentMirror = Mirror(reflecting: content)
        let blocksCount = Mirror(reflecting: contentMirror.descendant("value")!).children.count
        HStack {
            ForEach(0..<blocksCount) { index in
                let tupleBlock = contentMirror.descendant("value",".\(index)")
                let text = Mirror(reflecting: tupleBlock!).descendant("content") as! Text
                let tag = Mirror(reflecting: tupleBlock!).descendant("modifier", "value", "tagged") as! SelectionValue
                
                Button.init(action: {
                    selection = tag
                }, label: {
                    text.padding(.vertical, 10)
                })
                
                .background(
                    Group {
                        if tag == selection {
                            Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)).frame(height: 2)
                                .matchedGeometryEffect(id: "selector", in: ns)
                        }
                    },
                    alignment: .bottom
                )
                .accentColor(tag == selection ? Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)) : Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                .animation(.easeInOut)
            }
        }
    }
}

*/
struct DatePicker2View_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker2View()
    }
}
