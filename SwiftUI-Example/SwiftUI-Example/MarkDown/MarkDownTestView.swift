//
//  MarkDownTestView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/5/1.
//

import SwiftUI
import MarkdownUI

struct MarkDownTestView: View {
    @State var markdown: String = ""
    
    private var markdownDocument: Document? {
        guard let path = Bundle.main.path(forResource: "MarkDownTestReader", ofType: "md") else {
            return nil
        }
        
        return try? Document(contentsOfFile: path)
    }
    
    var body: some View {
        ScrollView {
            Markdown.init(markdownDocument!)
        }
    }
}

struct MarkDownTestView_Previews: PreviewProvider {
    static var previews: some View {
        MarkDownTestView()
    }
}
