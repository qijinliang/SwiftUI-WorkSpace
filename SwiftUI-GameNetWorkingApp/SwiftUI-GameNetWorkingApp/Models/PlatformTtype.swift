//
//  Platform.swift
//  SwiftUI-GameNetWorkingApp
//
//  Created by qjinliang on 2020/6/20.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

enum PlatformType: CaseIterable, CustomStringConvertible {
    case all
    case ps4
    case xboxone
    case nintenSwitch

    var id: Int {
        switch self {
        case .all:
            return 0
        case .ps4:
            return 48
        case .xboxone:
            return 49
        case .nintenSwitch:
            return 130
        }
    }
    
    var description: String {
        switch self {
        case .all:
            return "所有类型"
        case .ps4:
            return "PS4"
        case .xboxone:
            return "微软XBOX ONE"
        case .nintenSwitch:
            return "任天堂SWITCH"
        }
    }
    
    static var filterIds: [Int] {
        [PlatformType.ps4.id, PlatformType.xboxone.id, PlatformType.nintenSwitch.id]
    }
    
    static var filterText: String {
        filterIds.map{ String($0) }.joined(separator: ",")
    }
    
}

