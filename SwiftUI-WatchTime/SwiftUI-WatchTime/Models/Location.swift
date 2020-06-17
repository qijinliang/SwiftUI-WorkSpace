//
//  Location.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation
import SwiftUI

struct Location: Codable, Identifiable {
    let id: UUID
    let name: String
    let area: String
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "location"
        case area = "area"
    }
}
