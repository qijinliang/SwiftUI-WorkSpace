//
//  PlaylistCardView.swift
//  SwiftUI-MuiscPlayer
//
//  Created by Cheney on 2021/5/20.
//

import SwiftUI

struct PlaylistCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Spacer()
            
            HStack {
                Text("Playlist Name")
                Text("Playlist Details")
                
                Spacer()
            }
            .padding(10)
            .frame(height: 50)
            .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
        }
    }
}

struct PlaylistCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistCardView()
    }
}
