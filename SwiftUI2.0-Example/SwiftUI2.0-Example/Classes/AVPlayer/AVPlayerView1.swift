//
//  AVPlayerView1.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/7/14.
//

import SwiftUI
import AVKit

struct AVPlayerView1: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url:  URL(string: "https://v-cdn.zjol.com.cn/276985.mp4")!)) {
            VStack {
                Text("Watermark")
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.7))
                Spacer()
            }
            .frame(width: 400, height: 300)
        }
    }
}

struct AVPlayerView1_Previews: PreviewProvider {
    static var previews: some View {
        AVPlayerView1()
    }
}
