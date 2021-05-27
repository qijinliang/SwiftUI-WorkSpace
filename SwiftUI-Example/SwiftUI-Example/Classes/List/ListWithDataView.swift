//
//  ListWithDataView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct ListWithDataView: View {
    @State private var ArrayText = ["This is the simplest List", "Evans","Lemuel James Guerrero", "Mark", "Durtschi","Chase","Adam","Rodrigo","Notice the automatic wrapping","When the text is longer"]
    var body: some View {
        List(ArrayText, id: \.self) { text in
         Text(text).font(.title)
        }
        //MARK: 去掉分割线
        .listStyle(SidebarListStyle())
    }
}

struct ListWithDataView_Previews: PreviewProvider {
    static var previews: some View {
        ListWithDataView()
    }
}
