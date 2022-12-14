//
//  Implicit2.swift
//  SwiftUI3.0-Example
//
//  Created by 金亮 on 2021/9/26.
//

import SwiftUI

struct Implicit2: View {
    @State private var isLoading = false
    var body: some View {
        
        ZStack() {
            
            Circle().stroke(Color(.systemGray5), lineWidth: 14)
                .frame(width: 100, height: 100)
            
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.green, lineWidth: 7)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
                .onAppear(){
                    self.isLoading = true
                }
        }
        
    }
    
}

struct Implicit2_Previews: PreviewProvider {
    static var previews: some View {
        Implicit2()
    }
}
