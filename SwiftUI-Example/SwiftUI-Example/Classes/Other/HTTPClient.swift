//
//  HTTPClient.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/4/28.
//

import Foundation
import Combine

public class HTTPClient {
    
    func request<T: Decodable>(url: URL, method: String?, headers: [String: String]? = nil, bodyData: Data? = nil) -> AnyPublisher<T, Error> {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        request.httpBody = bodyData
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data, response) in
                guard let httpURLResponse = response as? HTTPURLResponse else {
                    fatalError("request type in invaild")
                }
                
                guard httpURLResponse.statusCode == 200 else {
                    fatalError("http request type in statu code")
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { $0 as Error }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}
