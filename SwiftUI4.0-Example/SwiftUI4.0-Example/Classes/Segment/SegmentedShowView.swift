//
//  SegmentedShowView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/4/6.
//

import SwiftUI

struct SegmentedShowView: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: Segmented1View()) {
                    Text("Segmented1")
                }
                NavigationLink(destination: Segmented2View()) {
                    Text("Segmented2")
                }
                NavigationLink(destination: Segmented3View()) {
                    Text("Segmented3")
                }
            }
        }
    }
}

struct SegmentedShowView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedShowView()
    }
}
