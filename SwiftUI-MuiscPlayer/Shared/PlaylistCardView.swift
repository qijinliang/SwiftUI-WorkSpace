//
//  PlaylistCardView.swift
//  SwiftUI-MuiscPlayer
//
//  Created by Cheney on 2021/5/20.
//

import SwiftUI
import MediaPlayer

struct PlaylistCardView: View {
    
    let playlist: MPMediaItemCollection

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Spacer()
            
            HStack {
                Text("\(playlist.value(forProperty: MPMediaPlaylistPropertyName) as? String ?? "NA")")
                Text("\(playlist.value(forProperty: MPMediaPlaylistPropertyDescriptionText ) as? String ?? "NA")")
                
                Spacer()
            }
            .padding(10)
            .frame(height: 50) 
            .background(
                BlurView(style: .prominent)
                    .cornerRadius(10, corners: [.topLeft, .topRight])
            )
        }
        .background(
            Image(uiImage: playlist.representativeItem?.artwork?.image(at: CGSize(width: 500, height: 500)) ?? UIImage(named: "music_background") ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        )
        .aspectRatio(1, contentMode: .fit)
        .shadow(color: Color.black.opacity(0.05), radius: 2.5, x: 0, y: 2.5)
    }
}

