//
//  SpaceMainView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/28.
//

import SwiftUI

struct SpaceMainView: View {
    var body: some View {
        Section {
            NavigationLink(destination: SpaceShowView()) {
                Text("Space")
            }
        }
    }
}

struct SpaceMainView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceMainView()
    }
}
