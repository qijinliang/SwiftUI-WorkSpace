//
//  SegmentedMainView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/4/6.
//

import SwiftUI

struct SegmentedMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: SegmentedShowView()) {
                Text("Segmented")
            }
        }
        
    }
}

struct SegmentedMainView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedMainView()
    }
}
