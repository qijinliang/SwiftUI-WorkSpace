//
//  Model.swift
//  SwiftUI-MuiscPlayer
//
//  Created by Cheney on 2021/5/20.
//

import Foundation
import MediaPlayer

class Model: ObservableObject {
    static let shared = Model()
    
    @Published var currentSong: MPMediaItem?
    
    @Published var playlists = [MPMediaItemCollection]()
    @Published var librarySongs = [MPMediaItem]()
}
