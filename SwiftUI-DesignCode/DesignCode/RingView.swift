//
//  RingView.swift
//  DesignCode
//
//  Created by Meng To on 2019-12-10.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var color1 = #colorLiteral(red: 0, green: 0.3333333333, blue: 1, alpha: 1)
    var color2 = #colorLiteral(red: 0.631372549, green: 0.5294117647, blue: 1, alpha: 1)
    var width : CGFloat = 88
    var height : CGFloat = 88
    var percent: Int = 88
    @Binding var show: Bool
    
    var body: some View {
        let multiplier = width / 44
        let progress = CGFloat(100 - percent) / 100
        
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading), style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round))
                .frame(width: width, height: height)
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .shadow(color: Color(color1).opacity(0.3), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            
            Text("\(percent)%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
                .onTapGesture {
                    self.show.toggle()
            }
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
