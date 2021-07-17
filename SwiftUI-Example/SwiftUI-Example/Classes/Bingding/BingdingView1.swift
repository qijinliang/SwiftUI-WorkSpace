//
//  BingdingView1.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/7/14.
//

import SwiftUI

struct BingdingView1: View {
    
    
    @State private var isPlaying = false
    
    var body: some View {
        
        Button(action: {
            self.isPlaying.toggle()
        }, label: {
            Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                .font(.system(size: 150))
                .foregroundColor(.green)
        })
    }
}

struct BingdingView1_Previews: PreviewProvider {
    static var previews: some View {
        BingdingView1()
    }
}
