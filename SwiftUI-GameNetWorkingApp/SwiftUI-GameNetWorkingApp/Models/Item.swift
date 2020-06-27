//
//  Item.swift
//  SwiftUI-GameNetWorkingApp
//
//  Created by qjinliang on 2020/6/25.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

struct Item: Hashable {
    
    var itemType: ItemType
    enum ItemType {
        case genre(type: GenerType, isSelected: Bool)
        case platfrom(type: PlatformType, isSelected: Bool)
        case sort(type: SortType, isSelected: Bool)
        case game(Game)
    }
    
    var identfiner: String {
        let identifner: String
        switch itemType {
        case .genre(let type, let isSelected):
            identifner = "genre_\(type)_\(isSelected)"
        case .platfrom(let type, let isSelected):
            identifner = "platform_\(type)_\(isSelected)"
        case .sort(let type, let isSelected):
            identifner = "sort_\(type)_\(isSelected)"
        case .game(let game):
            identifner = "\(game.id)"
        }
        return identifner
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identfiner)
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.identfiner == rhs.identfiner
    }
    
}
