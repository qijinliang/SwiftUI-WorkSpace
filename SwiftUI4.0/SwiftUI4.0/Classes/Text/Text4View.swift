//
//  Text4View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Text4View: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                HStack(spacing: 0) {
                    Image.init(systemName: "w.square.fill")
                        .font(.system(size: 40))
                        .foregroundColor(Color(#colorLiteral(red: 0.3964672983, green: 0.1600626409, blue: 0.03812957183, alpha: 1)))
                    Image.init(systemName: "plus")
                    Image.init(systemName: "f.square.fill")
                        .font(.system(size: 40))
                        .foregroundColor(Color(#colorLiteral(red: 0.3964672983, green: 0.1600626409, blue: 0.03812957183, alpha: 1)))
                }
                
                Group() {
                    Text("ultraLight - title")
                        .font(.title)
                        .fontWeight(.ultraLight)
                    Text("thin - body")
                        .font(.body)
                        .fontWeight(.thin)
                    Text("light - largeTitle")
                        .font(.largeTitle)
                        .fontWeight(.light)
                    Text("bold - callout")
                        .font(.callout)
                        .fontWeight(.bold)
                    Text("black.title")
                        .font(.title)
                        .fontWeight(.black)
                    
                }.font(.largeTitle)
            }
        }
        .navigationTitle("文本和粗体一起使用")
    }
}

struct Text4View_Previews: PreviewProvider {
    static var previews: some View {
        Text4View()
    }
}
