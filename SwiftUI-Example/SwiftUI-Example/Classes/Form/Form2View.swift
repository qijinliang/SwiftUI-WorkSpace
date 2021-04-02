//
//  Form2IView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/31.
//

import SwiftUI

struct Form2View: View {
    var body: some View {
        Form() {
            Section(header: Text("Section Header Text")) {
                Text("You can add any view in a section header")
                Text("Notice the default forground color is gray")
            }
            Section(header: sectionTextAndImage(name: "People", image: "person.2.square.stack.fill")){
                Text("Here's an example of a section header with image and text")
            }
            
            Section(footer: Text("Toal: $5,600.00")) {
                Text("Here is an example of a section footer")
            }
        }
    }
}

struct sectionTextAndImage: View {
    
    var name: String
    var image: String
    
    var body: some View {
        HStack() {
            Image.init(systemName: image).padding(.trailing)
            Text(name)
        }
        .padding()
        .font(.title)
        .foregroundColor(.purple)
    }
}

struct Form2View_Previews: PreviewProvider {
    static var previews: some View {
        Form2View()
    }
}
