//
//  GridView.swift
//  SwiftUI-SmartHome
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct GridView: View {
    var numberOfLights: CGFloat = 13.0
    var numberOfColumn: CGFloat = 4.0
    var lightSize: CGFloat = 20
    var vSpacing: CGFloat = 10
    var hSpacing: CGFloat = 20
    var placeName = "Work"
    
    var body: some View {
        
        let numberOfRows = Int(numberOfLights / numberOfColumn)
        let remainingRows = ceil(numberOfLights.truncatingRemainder(dividingBy: numberOfColumn))
        
        return Group {
            VStack(alignment: .leading, spacing: vSpacing) {
                ForEach(0..<numberOfRows) { i in
                    HStack(spacing: self.hSpacing) {
                        ForEach(0..<Int(self.numberOfColumn)) {_ in
                            Circle()
                                .frame(width: self.lightSize, height: self.lightSize)
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                HStack(spacing: hSpacing) {
                    ForEach(0..<Int(remainingRows)) {_ in
                       Circle()
                         .frame(width: self.lightSize, height: self.lightSize)
                         .foregroundColor(Color.gray)
                    }
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
