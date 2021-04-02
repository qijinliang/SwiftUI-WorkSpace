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
                    .font(.title2)
                    .foregroundColor(.gray)
                Text("Forms and Lists allow you to seet a background view with a function called \"listRowBackground(view:)\".")
                    .font(.title2)
                    //MARK: horizontal: true 就不会换行
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                Text("You can call this modifier function on just one row, list this.")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .foregroundColor(.white)
                    //MARK: list铺满颜色需要使用listRowBackground，而不是background
                    .listRowBackground(Color.purple)
                    .fixedSize()
            }
        }
    }
}

struct Form3View_Previews: PreviewProvider {
    static var previews: some View {
        Form3View()
    }
}
