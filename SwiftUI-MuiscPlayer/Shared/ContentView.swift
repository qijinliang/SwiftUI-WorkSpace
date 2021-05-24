//
//  ContentView.swift
//  Shared
//
//  Created by Cheney on 2021/5/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = Model.shared
    var body: some View {
        TabView {
            PlaylistView()
                .environmentObject(model)
                .tabItem {
                    VStack {
                        Image.init(systemName: "music.note.list")
                        Text("Playlists")
                    }
                }
            LibraryView()
                .environmentObject(model)
                .tabItem {
                    VStack {
                        Image.init(systemName: "music.note")
                        Text("Library")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
