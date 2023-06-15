//
//  AnimationMainView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/26.
//

import SwiftUI

struct AnimationMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: AnimationShowView()) {
                Text("Animation")
            }
        }
    }
}

struct AnimationMainView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationMainView()
    }
}
