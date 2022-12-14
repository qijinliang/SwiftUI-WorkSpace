//
//  FormShowView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/31.
//

import SwiftUI

struct FormShowView: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: Form1View()) {
                    Text("Form1")
                }
                
                NavigationLink(destination: Form2View()) {
                    Text("Form2")
                }
                NavigationLink(destination: Form3View()) {
                    Text("Form3")
                }
                NavigationLink(destination: Form4View()) {
                    Text("Form4")
                }
                NavigationLink(destination: Form5View()) {
                    Text("Form5")
                }
            }
        }
    }
}

struct FormShowView_Previews: PreviewProvider {
    static var previews: some View {
        FormShowView()
    }
}
