//
//  RemoteTimeZone.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation
import SwiftUI

struct RemoteTimeZone: Codable {
    let utcOffset: String
    let utcDatetime: String
    let timezone: String
    let datetime: String
}
