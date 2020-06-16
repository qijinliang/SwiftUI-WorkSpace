//
//  SliderComponent.swift
//  SwiftUI-SmartHome
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct SliderComponent: View {
    
    @Binding var selectLightColor: String
    @Binding var brightnessLevle: CGFloat
    
    var body: some View {
        GeometryReader { gr in
            VStack {
                Image(systemName: "sun.min.fill")
                    .resizable().frame(width: 30, height: 30)
                    .foregroundColor(Color(self.selectLightColor))
                    .shadow(color: Color(self.selectLightColor), radius: 7, x: 0, y: 0)
                    .opacity(0.2 + Double(self.brightnessLevle))
                
                SliderView(lightColor: self.$selectLightColor, onChange: { value in
                    self.brightnessLevle = value
                })
                
                Image(systemName: "sun.max")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(self.selectLightColor))

            }
        }
    }
}

struct SliderComponent_Previews: PreviewProvider {
    static var previews: some View {
        SliderComponent(selectLightColor: .constant("neatRed"), brightnessLevle: .constant(0.5))
    }
}
