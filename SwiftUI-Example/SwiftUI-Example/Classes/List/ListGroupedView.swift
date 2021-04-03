//
//  ListGroupedView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct ListGroupedView: View {
    @State private var ArrayText = ["This is the simplest List", "Evans","Lemuel James Guerrero", "Mark", "Durtschi","Chase","Adam","Rodrigo","Notice the automatic wrapping","When the text is longer"]
    var body: some View {
        List(ArrayText, id: \.self) { text in
            HStack() {
                Text(text)
                    //MARK - 判断文字内容
                    .font(text == "This is the simplest List" ? Font.largeTitle : Font.body)
                Spacer()
                Image.init(systemName: text == "Mark" ? "circle.fill":"circle")
                    .foregroundColor(Color.green)
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ListGroupedView_Previews: PreviewProvider {
    static var previews: some View {
        ListGroupedView()
    }
}
