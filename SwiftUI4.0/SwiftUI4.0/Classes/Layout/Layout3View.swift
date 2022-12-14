//
//  Layout3View.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/5/18.
//

import SwiftUI

struct Layout3View: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Text("Hello, World!")
                .alignmentGuide(.top, computeValue: { dimension in
                    return dimension[.top]
                })
                .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
            
            Text("Hello, World!")
                .alignmentGuide(.top, computeValue: { dimension in
                    return 100
                })
                .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
        }
        .background(Color.orange)
    }
}

struct Layout3View_Previews: PreviewProvider {
    static var previews: some View {
        Layout3View()
    }
}
