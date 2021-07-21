//
//  Text3View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Text3View: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Font Weights")
                .font(.title)
                .foregroundColor(.gray)
            Image.init(systemName: "w.square.fill")
                .font(.system(size: 40))
                .foregroundColor(Color(#colorLiteral(red: 0.3964672983, green: 0.1600626409, blue: 0.03812957183, alpha: 1)))
            VStack() {
                Text("You can apply a variety of font weights to the Text view.")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            Group() {
                Text("Font.ultraLight")
                    .fontWeight(.ultraLight)
                Text("Font.thin")
                    .fontWeight(.thin)
                Text("Font.light")
                    .fontWeight(.light)
                Text("Font.regular")
                    .fontWeight(.regular)
                Text("Font.medium")
                    .fontWeight(.medium)
                Text("Font.semibold")
                    .fontWeight(.semibold)
                Text("Font.bold")
                    .fontWeight(.bold)
                Text("Font.heavy")
                    .fontWeight(.heavy)
                Text("Font.black")
                    .fontWeight(.black)
            }.font(.largeTitle)
        }
    }
}

struct Text3View_Previews: PreviewProvider {
    static var previews: some View {
        Text3View()
    }
}
