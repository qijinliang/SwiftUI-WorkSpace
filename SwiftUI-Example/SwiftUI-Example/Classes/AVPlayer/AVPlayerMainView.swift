//
//  AVPlayerMainView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/7/14.
//

import SwiftUI

struct AVPlayerMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: AVPlayerShowView()) {
                Text("AVPlayer")
            }
        }
    }
}

struct AVPlayerMainView_Previews: PreviewProvider {
    static var previews: some View {
        AVPlayerMainView()
    }
}
