//
//  TreeListView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/5/15.
//

import SwiftUI

struct TreeListView: View {

    let data: [FileItem]
    
    var body: some View {
        List(data, children: \.children, rowContent: {
            Text($0.name)
        })
    }
}

struct FileItem: Identifiable {
    let name: String
    var children: [FileItem]?
    
    var id: String { name }
    
    
}

struct FSDisclosureGroup<Label, Content>: View where Label: View, Content: View {
    @State var isExpanded: Bool = true
    var content: () -> Content
    var label: () -> Label
    
    var body: some View {
        
        Button(action: { isExpanded.toggle() }, label: { label().foregroundColor(.blue) })
        if isExpanded {
            content()
        }
    }
}

public struct HierarchyList<Data, RowContent>: View where Data: RandomAccessCollection,Data.Element: Identifiable,RowContent: View {
    private let recursiveView: RecursiveView<Data,RowContent>
    
    public init(data: Data, children: KeyPath<Data.Element, Data?>, rowContent: @escaping (Data.Element) -> RowContent) {
        self.recursiveView = RecursiveView(data: data, children: children, rowContent: rowContent)
    }
    
    public var body: some View {
        List {
            recursiveView
        }
    }
}

private struct RecursiveView<Data,RowContent>: View where Data: RandomAccessCollection, Data.Element: Identifiable,RowContent: View {
    
    let data: Data
    let children: KeyPath<Data.Element, Data?>
    let rowContent: (Data.Element) -> RowContent
    
    
    var body: some View {
        ForEach(data) { child in
            if let subChildren = child[keyPath: children] {
                DisclosureGroup {
                    RecursiveView(data: subChildren, children: children, rowContent: rowContent)
                        .padding(.leading)
                } label: {
                    rowContent(child)
                }
            }else{
                rowContent(child)
            }
        }
    }
}

//struct TreeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TreeListView()
//    }
//}
