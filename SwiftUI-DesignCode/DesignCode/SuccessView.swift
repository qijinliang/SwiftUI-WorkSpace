//
//  SuccessView.swift
//  DesignCode
//
//  Created by Meng To on 2019-12-13.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct SuccessView: View {
    @State var show = false
    
    var body: some View {
        VStack {
            Text("Logging you...").font(.title).bold()
                .padding(30)
                .opacity(show ? 1 : 0)
                .animation(Animation.linear(duration: 1).delay(0.2))
            
            LottieView(filename: "success")
                .frame(width: 300, height: 200)
                .offset(y: -30)
                .opacity(show ? 1 : 0)
                .animation(Animation.linear(duration: 1).delay(0.4))
                .scaleEffect(1.3)
        }
        .background(BlurView(style: .systemMaterial))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 30, x: 0, y: 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .scaleEffect(show ? 1 : 0.5)
        .background(Color.black.opacity(show ? 0.5 : 0))
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .onAppear {
            self.show = true
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
