//
//  GenerType.swift
//  SwiftUI-GameNetWorkingApp
//
//  Created by qjinliang on 2020/6/21.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

enum GenerType: CaseIterable, CustomStringConvertible {
    case all
    case adventure
    case acarcd
    case platfrom
    case rpg
    case shooter
    
    var id: Int {
        switch self {
        case .all:
            return 0
        case .adventure:
            return 31
        case .acarcd:
            return 25
        case .platfrom:
            return 8
        case .rpg:
            return 12
        case .shooter:
            return 5
        }
    }
    
    
    var description: String {
        switch self {
        case .all:
            return "所有类型"
        case .adventure:
            return "冒险"
        case .acarcd:
            return "电子街机"
        case .platfrom:
            return "平台对战"
        case .rpg:
            return "RPG角色扮演"
        case .shooter:
            return "射击"
        }
    }
    
    
    static var filterIds: [Int] {
        [GenerType.adventure.id,GenerType.acarcd.id, GenerType.platfrom.id, GenerType.rpg.id,GenerType.shooter.id]
    }
    
    static var filterText: String {
        filterIds.map{ String($0) }.joined(separator: ",")
    }
    
}
