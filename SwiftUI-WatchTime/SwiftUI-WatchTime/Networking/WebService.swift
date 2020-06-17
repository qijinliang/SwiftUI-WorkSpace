
//
//  WebServer.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

class WebService {
    private var url: String
    
    init(url: String) {
        self.url = url
    }
    
    func get(completion: @escaping((Result<Data, Error>) -> ())) {
    
        guard let url = URL(string: self.url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
