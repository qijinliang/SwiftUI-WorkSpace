//
//  Picture.swift
//  SwiftUI-Picture
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

struct Picture: Identifiable {
    let id = UUID()
    var imageName: String
    
    static func data() -> [Picture] {
        return [
            .init(imageName: "1"),
            .init(imageName: "2"),
            .init(imageName: "3"),
            .init(imageName: "4"),
            .init(imageName: "header")
        ]
    }
}
