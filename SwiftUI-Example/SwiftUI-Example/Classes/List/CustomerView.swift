//
//  CustomerView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct CustomerView: View {
    @State private var arrayText = ["This is the simplest List", "Evans","Lemuel James Guerrero", "Mark", "Durtschi","Chase","Adam","Rodrigo","Notice the automatic wrapping","When the text is longer"]
    var body: some View {
        List(arrayText, id: \.self) { text in
            HStack(spacing: 0) {
                Image.init(systemName: "person.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(text == "This is the simplest List" ? Color.green : Color.black)
                Text(text)
                    .foregroundColor(text == "This is the simplest List" ? Color.green : Color.black)
            }
        }
        .font(.title3)
    }
}

struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
    }
}
