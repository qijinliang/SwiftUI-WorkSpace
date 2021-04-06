//
//  Form3View.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/4/2.
//

import SwiftUI

struct Form3View: View {
    var body: some View {
        Form() {
            Section(header: Text("Form").font(.largeTitle)) {
                Text("List Row Background")
                    .foregroundColor(.gray)
                Text("Forms and Lists allow you to seet a background view with a function called \"listRowBackground(view:)\".")
                    //MARK: horizontal: true 就不会换行
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                Text("You can call this modifier function on just one row, list this.")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    //MARK: list铺满颜色需要使用listRowBackground，而不是background
                    .listRowBackground(Color.purple)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .font(.title2)
            
            Section(header: Text("Whloe Section").font(.largeTitle).foregroundColor(.gray)) {
                Text("Or you can set a view or color for a whole section.")
                Image.init(systemName: "smiley.fill").frame(maxWidth: .infinity, alignment: .center).font(.largeTitle)
                Text("Note, even though the color is set on the Section, the color of the section header is not affected.")
            }
            .listRowBackground(Color.purple)
            .foregroundColor(.white)
            .font(.title2)
        }
    }
}

struct Form3View_Previews: PreviewProvider {
    static var previews: some View {
        Form3View()
    }
}
