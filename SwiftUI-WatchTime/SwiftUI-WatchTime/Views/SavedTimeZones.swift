//
//  SavedTimeZones.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct SavedTimeZones: View {
    
    var timeZone = TimeZone.init()

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                    Text("")
                }
            }
    }
}

struct SavedTimeZones_Previews: PreviewProvider {
    static var previews: some View {
        SavedTimeZones()
    }
}
