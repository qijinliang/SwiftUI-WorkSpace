//
//  Text2View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Text2View: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                VStack() {
                    Text("文本的大小这里.font(.xxxx)")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                
                Divider()
                
                Group() {
                    Text("Font.lateTitle")
                        .font(.largeTitle)
                    Text("Font.title")
                        .font(.title)
                    Text("Font.headline")
                        .font(.headline)
                    Text("Font.subheadline")
                        .font(.subheadline)
                    Text("Font.body")
                        .font(.body)
                    Text("Font.callout")
                        .font(.callout)
                    Text("Font.caption")
                        .font(.caption)
                    Text("Font.footnote")
                        .font(.footnote)
                }
            }
            .navigationTitle("文本样式")
        }
    }
}

struct Text2View_Previews: PreviewProvider {
    static var previews: some View {
        Text2View()
    }
}
