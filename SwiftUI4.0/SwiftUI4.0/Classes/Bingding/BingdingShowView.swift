//
//  BingdingShowView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/7/14.
//

import SwiftUI

struct BingdingShowView: View {
    var body: some View {
        Form() {
            Section(header: Text("BingdingView1").font(.title3).fontWeight(.heavy)) {
                NavigationLink(destination: BingdingView1()) {
                    Text("BingdingView1")
                }
                
                NavigationLink(destination: BingdingView2()) {
                    Text("BingdingView2")
                }
            }
        }
    }
}

struct BingdingShowView_Previews: PreviewProvider {
    static var previews: some View {
        BingdingShowView()
    }
}
