//
//  MapMainView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/8.
//

import SwiftUI

struct MapMainView: View {
    var body: some View {
        Section {
            NavigationLink(destination: MapShowView()) {
                Text("Map")
            }
        }
    }
}

struct MapMainView_Previews: PreviewProvider {
    static var previews: some View {
        MapMainView()
    }
}
