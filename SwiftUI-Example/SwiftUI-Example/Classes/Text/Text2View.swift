//
//  Text2View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Text2View: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Text Style")
                .font(.title)
                .foregroundColor(.gray)
            Image.init(systemName: "f.square.fill")
                .font(.system(size: 40))
                .foregroundColor(Color(#colorLiteral(red: 0.3964672983, green: 0.1600626409, blue: 0.03812957183, alpha: 1)))
            VStack() {
                Text("You can add a TextStyle to the Text view by calling.fong(Font.<Text Style>).")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            
            Text("Avaliable Text Style")
                .font(.title)
                .foregroundColor(.gray)
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
    }
}

struct Text2View_Previews: PreviewProvider {
    static var previews: some View {
        Text2View()
    }
}
