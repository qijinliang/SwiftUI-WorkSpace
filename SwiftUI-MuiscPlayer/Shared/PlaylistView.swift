//
//  PlaylistView.swift
//  SwiftUI-MuiscPlayer
//
//  Created by Cheney on 2021/5/20.
//

import SwiftUI

struct PlaylistView: View {
    @EnvironmentObject var model: Model
    var body: some View {
        NavigationView {
            List {
                ForEach(model.playlists, id: \.self) {
                    playlist in
                    PlaylistCardView(playlist: playlist)
                }
            }
            .navigationBarTitle(Text("Playlists"),displayMode: .automatic)
        }
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView()
    }
}
