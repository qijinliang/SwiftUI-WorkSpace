 //
//  HStack4SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/17.
//

import SwiftUI

struct HStack4SwiftUIView: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("HStack")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            HStack(alignment: .bottom) {
                Text("Hello")
                Text("amzzing")
                    .font(.largeTitle)
                Text("developer!")
            }
            
            HStack(alignment: .firstTextBaseline) {
                Text("Hello")
                Text("amzzing")
                    .font(.largeTitle)
                Text("developer!")
            }
        }
    }
}

struct HStack4SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HStack4SwiftUIView().preferredColorScheme(.dark)
    }
}
