//
//  PathMainView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/5/27.
//

import SwiftUI

struct PathMainView: View {
    var body: some View {
        Section {
            NavigationLink(destination: MapShowView()) {
                Text("Map")
            }
        }
    }
}

struct PathMainView_Previews: PreviewProvider {
    static var previews: some View {
        PathMainView()
    }
}
