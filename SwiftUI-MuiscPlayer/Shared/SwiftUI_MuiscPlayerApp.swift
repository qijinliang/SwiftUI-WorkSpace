//
//  SwiftUI_MuiscPlayerApp.swift
//  Shared
//
//  Created by Cheney on 2021/5/20.
//

import SwiftUI
import StoreKit
import MediaPlayer

@main
struct SwiftUI_MuiscPlayerApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        updateSongs()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase, perform: { value in
                    if value == .active {
                        updateSongs()
                    }
                })
        }
    }
    
    func updateSongs() {
        SKCloudServiceController.requestAuthorization { status in
            if status == .authorized {
                let songsQuery = MPMediaQuery.songs()
                if let songs = songsQuery.items {
                    let desc = NSSortDescriptor(key: MPMediaItemPropertyLastPlayedDate, ascending: false)
                    let sortedSongs = NSArray(array: songs).sortedArray(using: [desc])
                    
                    Model.shared.librarySongs = sortedSongs as! [MPMediaItem]
                }
                
                let playlistQuery = MPMediaQuery.playlists()
                if let playlists = playlistQuery.collections {
                    Model.shared.playlists = playlists
                }
            }
        }
    }
}
