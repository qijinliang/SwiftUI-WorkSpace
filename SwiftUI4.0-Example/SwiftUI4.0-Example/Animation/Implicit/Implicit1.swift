//
//  Implicit1.swift
//  SwiftUI3.0-Example
//
//  Created by Cheney on 2021/9/26.
//

import SwiftUI

struct Implicit1: View {
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
            
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ?  .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
                self.circleColorChanged.toggle()
                self.heartSizeChanged.toggle()
            }
            self.heartColorChanged.toggle()
        }
    }
}


struct Implicit1_Previews: PreviewProvider {
    static var previews: some View {
        Implicit1()
    }
}
