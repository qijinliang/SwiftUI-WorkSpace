//
//  SliderMainView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/4/6.
//

import SwiftUI

struct SliderMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: SliderShowView()) {
                Text("Slider")
            }
        }
    }
}

struct SliderMainView_Previews: PreviewProvider {
    static var previews: some View {
        SliderMainView()
    }
}
