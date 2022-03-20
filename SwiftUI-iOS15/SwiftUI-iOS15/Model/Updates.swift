//
//  Updates.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/18.
//

import SwiftUI

struct Update: Identifiable, Decodable {
    var id: Int
    var coin_name: String
    var acronym: String
    var logo: String
}

class Updates: ObservableObject {
    @Published var items: [Update] = []
    
    @MainActor
    func fetchUpdates() async {
        do {
            let url = URL(string: "https://random-data-api.com/api/crypto_coin/random_crypto_coin?size=10")!
            let (data, _) = try await URLSession.shared.data(from: url)
            items = try JSONDecoder().decode([Update].self, from: data)
        } catch {
            print("Error")
        }
    }
}

