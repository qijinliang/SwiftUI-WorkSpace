//
//  AddedTimeZoneView.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct AddedTimeZoneView: View {
    
    var timeZone = TimeZone.init("测试","测试", "测试")
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(timeZone.area).font(.system(size: 15, weight: Font.Weight.black))
            Text(timeZone.location).foregroundColor(Color.gray)
        }.padding()
            .background(Color.white)
        .cornerRadius(20)
            .shadow(color: Color.gray.opacity(0.2), radius: 8, x: 0, y: 0)
    }
}

struct AddedTimeZoneView_Previews: PreviewProvider {
    static var previews: some View {
        AddedTimeZoneView()
    }
}
