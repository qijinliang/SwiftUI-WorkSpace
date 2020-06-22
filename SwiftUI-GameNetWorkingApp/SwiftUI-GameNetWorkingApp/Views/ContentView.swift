//
//  ContentView.swift
//  SwiftUI-GameNetWorkingApp
//
//  Created by qjinliang on 2020/6/20.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                GameStore.shared.fetchGame(with: .games) { (result) in
                    switch result {
                    case .success(let games):
                        print(games.count)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .onAppear {
                GameStore.shared.fetchGame(with: .games) { (result) in
                    switch result {
                    case .success(let games):
                        print(games.count)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        }
    }
}

