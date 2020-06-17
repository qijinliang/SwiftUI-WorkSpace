//
//  TimeZone.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

struct TimeZone: Identifiable {

    let id: UUID
    let area: String
    let location: String
    let utcOffset: String

    init() {
        id = UUID()
        self.area = "No area"
        self.location = "No location"
        self.utcOffset = "00:00"
    }

    init(_ area: String,_ location: String,_ utcOffset: String  ) {
        id = UUID()
        self.area = area
        self.location = location
        self.utcOffset = utcOffset
    }

    init(from remoteTimeZone: RemoteTimeZone) {
        id = UUID()
        utcOffset = remoteTimeZone.utcOffset
        area = String(remoteTimeZone.timezone.split(separator: "/").first ?? "")
        location =  String(remoteTimeZone.timezone.split(separator: "/").last ?? "")

    }
}
