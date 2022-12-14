//
//  FormMainView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/31.
//

import SwiftUI

struct FormMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: FormShowView()) {
                Text("Form")
            }
        }
    }
}

struct FormMainView_Previews: PreviewProvider {
    static var previews: some View {
        FormMainView()
    }
}
