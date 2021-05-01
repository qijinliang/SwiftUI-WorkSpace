//
//  MarkDownTestView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/5/1.
//

import SwiftUI
import Parma

struct MarkDownTestView: View {
    @State var markdown: String = ""
    var body: some View {
        ScrollView {
            Parma(markdown)
                .padding(.horizontal, 24)
        }
        .onAppear {
            let url = Bundle.main.url(forResource: "MarkDownTestReader", withExtension: "md")!
            markdown = try! String(contentsOf: url)
        }
    }
}

struct MarkDownTestView_Previews: PreviewProvider {
    static var previews: some View {
        MarkDownTestView()
    }
}
