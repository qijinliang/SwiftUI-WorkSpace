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
            ScrollView {
                ForEach(model.playlists.indices.filter{ $0 % 2 == 0 }, id: \.self) { index in
                    HStack(spacing: 0) {
                        if index < model.playlists.count {
                            PlaylistCardView(playlist: model.playlists[index])
                                .padding(7.5)
                                .drawingGroup()
                        }
                        
                        if index + 1 < model.playlists.count {
                            PlaylistCardView(playlist: model.playlists[index + 1])
                                .padding(7.5)
                                .drawingGroup()
                        }
                    }
                }
                .padding(.horizontal, 7.5)
            }
            .navigationBarTitle(Text("Playlists"),displayMode: .automatic)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView()
    }
}
