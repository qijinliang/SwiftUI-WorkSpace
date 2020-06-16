//
//  PlaceView.swift
//  SwiftUI-SmartHome
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct PlaceView: View {
    
    var brightnessLevel: CGFloat = 0
    var isSelected = false
    var numberOfLights: CGFloat = 13
    var numberOfColumn: CGFloat = 4.0
    var lightSize: CGFloat = 20
    var vSpacing: CGFloat = 10
    var hSpacing: CGFloat = 10
    var placeName = "Work"
    var lightColor = "neatRed"
    
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(Color(lightColor))
            .frame(width: 30, height: 30)
            
            HStack(spacing: 30) {
                VStack(alignment: .leading) {
                    Text("\(self.placeName)").fontWeight(.bold).foregroundColor(Color("bg"))
                    Text("\(Int(self.numberOfLights))亮度").font(.footnote).foregroundColor(Color(lightColor))
                    
                    GridView(numberOfLights: self.numberOfLights, numberOfColumn: self.numberOfColumn, lightSize: self.lightSize, vSpacing: self.vSpacing, hSpacing: self.hSpacing, placeName: self.placeName)
                }
                VStack(spacing: -7) {
                    GeometryReader { gr in
                        Rectangle().offset(y: gr.size.height * (1 - self.brightnessLevel))
                            .foregroundColor(Color(self.lightColor))
                    }
                }.frame(width: 10)
                    .background(Color(self.lightColor).opacity(0.2))
                .cornerRadius(50)
            }.padding().modifier(Border(cornerRadius: 5, width: 1, color: isSelected ? Color(lightColor) : Color.gray.opacity(0.5)))
        }
    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceView()
    }
}
