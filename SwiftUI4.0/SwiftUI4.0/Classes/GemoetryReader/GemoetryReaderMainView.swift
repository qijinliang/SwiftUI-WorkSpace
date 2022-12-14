//
//  GemoetryReaderMainView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/27.
//

import SwiftUI

struct GemoetryReaderMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: GemoetryReaderShowView()) {
                Text("GemoetryReader")
            }
        }
    }
}

struct GemoetryReaderMainView_Previews: PreviewProvider {
    static var previews: some View {
        GemoetryReaderMainView()
    }
}
