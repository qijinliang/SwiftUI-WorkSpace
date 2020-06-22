//
//  GameStore.swift
//  SwiftUI-GameNetWorkingApp
//
//  Created by qjinliang on 2020/6/21.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

class GameStore: GameService {
    
    static var shared = GameStore()
    
    let baseAPIURL = "https://api-v3.igdb.com/"
    let userKey = "b9927aedda85d5a2cf2aaa8b0ad92b3d"
    let urlSession = URLSession.shared
    let josnDecoder = Utils.josnDecoder
    
    
    func fetchGame(with endpoint: GameEndpoint, completion: @escaping (Result<[Game], GameError>) -> ()) {
        
        guard let url = URL(string: "\(baseAPIURL)\(endpoint.rawValue)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        let platforms = PlatformType.filterText
        let genres = GenerType.filterText
        
      
        let params = "fields name, first_release_date, id, popularity, rating, genres.id, platforms.id, cover.image_id; where platforms = (\(platforms)) & genres = (\(genres)) ;sort popularity desc; limit 20;"
        
        self.loadDataAndDecoder(url: url, parmas: params, completion: completion)
    }
    
    
    func loadDataAndDecoder<D: Decodable>(url: URL, parmas: String? = nil, completion: @escaping(Result<D, GameError>) -> ()){

        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        guard let finalURL = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        guard let params = parmas else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        var urlRequest = URLRequest(url: finalURL)
        urlRequest.setValue(userKey, forHTTPHeaderField: "user-key")
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = params.data(using: .utf8)
        
        print(finalURL)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                self.executeCompletionInMainThred(with: .failure(.apiError), completion: completion)
                return
            }
            
            print(response)
            
            guard let httpResonse = response as? HTTPURLResponse, 200..<300 ~=  httpResonse.statusCode else {
                self.executeCompletionInMainThred(with: .failure(.invalidResponse), completion: completion)
                return
            }
            
            guard let data = data else {
                self.executeCompletionInMainThred(with: .failure(.noData), completion: completion)
                return
            }
            
            do {
                let decoderData = try self.josnDecoder.decode(D.self, from: data)
                self.executeCompletionInMainThred(with: .success(decoderData), completion: completion)
                
            } catch {
                self.executeCompletionInMainThred(with: .failure(.serializtionError), completion: completion)
            }
        }
        .resume()
    }
    
    func executeCompletionInMainThred<D: Decodable>(with result: Result<D, GameError>, completion: @escaping (Result<D, GameError>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
    
    
    
}
