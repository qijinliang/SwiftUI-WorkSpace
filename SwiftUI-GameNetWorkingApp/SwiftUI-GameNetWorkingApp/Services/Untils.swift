//
//  Untils.swift
//  SwiftUI-GameNetWorkingApp
//
//  Created by qjinliang on 2020/6/21.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

class Utils {
    static let josnDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
