//
//  Form4View.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/4/2.
//

import SwiftUI

struct Form4View: View {
    @State var isExpanded = Array(repeating: false, count: 4)
    
    private let FAQ = [
        (
            question: "问题一",
            answer: "折叠一"
        ),
        (
            question: "问题二",
            answer: "折叠二"
        ),
        (
            question: "问题三",
            answer: "折叠三"
        ),
        (
            question: "问题四",
            answer: "折叠四"
        )
    ]
    
    var body: some View {
        List {
            ForEach(FAQ.indices, id: \.self) { index in
                DisclosureGroup (
                    isExpanded: $isExpanded[index],
                    
                    content: {
                        Text(FAQ[index].answer)
                            .font(.body)
                            .fontWeight(.light)
                    },
                    
                    label: {
                        Text(FAQ[index].question)
                            .font(.body)
                            .bold()
                    }
                ).padding()
            }
        }
    }
}

struct Form4View_Previews: PreviewProvider {
    static var previews: some View {
        Form4View()
    }
}
