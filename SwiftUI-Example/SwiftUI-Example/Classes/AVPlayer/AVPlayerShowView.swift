//
//  AVPlayerShowView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/7/14.
//

import SwiftUI

struct AVPlayerShowView: View {
    var body: some View {
        Form() {
            Section(header: Text("AVPlayer").font(.title3).fontWeight(.heavy)) {
                NavigationLink(destination: AVPlayerView1()) {
                    Text("AVPlayer")
                }
            }
        }
    }
}

struct AVPlayerShowView_Previews: PreviewProvider {
    static var previews: some View {
        AVPlayerShowView()
    }
}
