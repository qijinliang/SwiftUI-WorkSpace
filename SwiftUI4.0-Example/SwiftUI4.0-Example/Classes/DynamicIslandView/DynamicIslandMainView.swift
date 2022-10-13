//
//  DynamicIslandMainView.swift
//  SwiftUI4.0-Example
//
//  Created by Cheney on 2022/10/11.
//

import SwiftUI

struct DynamicIslandMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: DynamicIslandShowView()) {
                Text("灵动岛")
            }
        }
    }
}

struct DynamicIslandMainView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicIslandMainView()
    }
}
