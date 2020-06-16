//
//  SliderView.swift
//  SwiftUI-SmartHome
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var lightColor: String
    @State var offsetY: CGFloat = 0.0
    var onChange: ((_ value: CGFloat)->()) = {_ in }
    var sliderWidth: CGFloat = 80
    
    var body: some View {
        GeometryReader { gr in
            VStack(spacing: -7) {
                ZStack() {
                    Rectangle().frame(width: 100, height: 3).foregroundColor(Color("bg"))
                    Rectangle().frame(width: 70, height: 15).cornerRadius(7.5).foregroundColor(Color("bg"))
                }.offset(y: self.offsetY)
                    .gesture(DragGesture().onChanged({ drag in
                        self.offsetY = min(max(drag.location.y, 0), gr.size.height - 7)
                        let value = 1 - self.offsetY / (gr.size.height - 7)
                        self.onChange(value)
                    }))
                Rectangle().frame(height: gr.size.height - 7).offset(y: self.offsetY)
                    .foregroundColor(Color(self.lightColor))
            }.frame(width: self.sliderWidth, height: gr.size.height, alignment: .bottom)
                .background(Color(self.lightColor).opacity(0.2))
            .cornerRadius(50)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(lightColor: .constant("neatRed"))
    }
}
