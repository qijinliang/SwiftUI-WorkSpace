//
//  SliderShowView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/4/6.
//

import SwiftUI

struct SliderShowView: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: Slider1View()) {
                    Text("Slider1")
                }
            }
        }
    }
}

struct SliderShowView_Previews: PreviewProvider {
    static var previews: some View {
        SliderShowView()
    }
}
