//
//  ImageBuilder.swift
//  SwiftUI-GameNetWorkingApp
//
//  Created by qjinliang on 2020/6/25.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

private let imageBaseURL = "https://images.igdb.com/igdb/image/upload/"

enum ImageSize: String {
    case COVER_BIG = "t_cover_big"
    case COVER_SMALL = "t_cover_small"
    
}

enum ImageType: String {
    case jpg = "jpg"
    case png = "png"
}

func ImageBuilder(imageId: String, imageSize: ImageSize = .COVER_BIG, imageType: ImageType = .jpg) -> String {
    return "\(imageBaseURL)\(imageSize.rawValue)/\(imageId).\(imageType.rawValue)"
}
