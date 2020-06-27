//
//  SortType.swift
//  SwiftUI-GameNetWorkingApp
//
//  Created by qjinliang on 2020/6/21.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

enum SortType: CaseIterable, CustomStringConvertible {
    case popularity
    case rating
    case releaseData
    
    var description: String {
        switch self {
        case .popularity:
            return "最多人喜欢"
        case .rating:
            return "最多评价"
        case .releaseData:
            return "最新发布"
        }
    }
    
}

