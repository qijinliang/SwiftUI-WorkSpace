//
//  MapShowView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/8.
//

import SwiftUI

struct MapShowView: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: Map1View()) {
                    Text("基本地图")
                }
                
            }
        }
    }
}

struct MapShowView_Previews: PreviewProvider {
    static var previews: some View {
        MapShowView()
    }
}
