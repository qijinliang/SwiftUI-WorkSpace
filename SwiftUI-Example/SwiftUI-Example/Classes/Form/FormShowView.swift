//
//  FormShowView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/31.
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
            }
        }
    }
}

struct FormShowView_Previews: PreviewProvider {
    static var previews: some View {
        FormShowView()
    }
}
