//
//  DataProvider.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

class DataProvider<T: Codable> {
    
    private var service: WebService
    
    init(service: WebService) {
        self.service = service
    }
    
    func provide(completion: @escaping(Result<T, Error>) -> ()) {
        service.get { result in
            switch result {
            case.success(let data):
                let parser = Parser<T>(data)
                parser.parse(onCompletion: { parserdResult in
                    completion(parserdResult)
                })
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
}

