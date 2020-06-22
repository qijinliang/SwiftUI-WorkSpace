//
//  GameService.swift
//  SwiftUI-GameNetWorkingApp
//
//  Created by qjinliang on 2020/6/21.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

protocol GameService {
    func fetchGame(with endpoint: GameEndpoint, completion: @escaping (Result<[Game], GameError>) -> ())
}

enum GameEndpoint: String {
    case games = "games"
    case platforms = "platforms"
}

enum GameError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializtionError
    
    var localizedDescription: String {
        switch self {
        case .apiError:
            return "失败， 服务器API接口错误"
        case .invalidEndpoint:
            return "失败， Endpoint错误，检查URL"
        case .invalidResponse:
            return "失败， 响应的数据不正确"
        case .noData:
            return "数据为空"
        case .serializtionError:
            return "数据decoder 编码出错"
        }
    }
}
