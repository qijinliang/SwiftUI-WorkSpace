//
//  BingdingView2.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/7/14.
//

import SwiftUI

struct BingdingView2: View {
    
    @State private var counter = 1
    
    var body: some View {
        CounterButton(counter: $counter, color: .red)
    }
}

struct CounterButton: View {
    
    
    @Binding var counter: Int
    
    var color: Color
    
    var body: some View {
        Button(action: {
            self.counter += 1
        }) {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
                .overlay(
                    Text("\(counter)")
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                )
        }
    }
}

struct BingdingView2_Previews: PreviewProvider {
    static var previews: some View {
        BingdingView2()
    }
}
