//
//  Parser.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

class Parser<T: Codable> {
    private var data: Data
    
    init(_ data: Data) {
        self.data = data
    }
    
    func parse(onCompletion: @escaping(Result<T, Error>) -> ()) {
        DispatchQueue(label: "com.liquidcoder", qos: .userInteractive, attributes: .concurrent).async {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let results = try decoder.decode(T.self, from: self.data)
                let result: Result<T, Error> = .success(results)
                onCompletion(result)
            }catch let error {
                let result: Result<T, Error> = .failure(error)
                onCompletion(result)
            }
        }
    }
}
