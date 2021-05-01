//
//  MarkReaderView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/5/1.
//

import SwiftUI

struct MarkReaderMainView: View {
    var body: some View {
        Section {
            NavigationLink(destination: MarkDownTestView()) {
                Text("MarkDownTest")
            }
        }
    }
}

struct MarkReaderMainView_Previews: PreviewProvider {
    static var previews: some View {
        MarkReaderMainView()
    }
}
