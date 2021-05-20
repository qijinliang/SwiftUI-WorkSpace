//
//  LibraryView.swift
//  SwiftUI-MuiscPlayer
//
//  Created by Cheney on 2021/5/20.
//

import SwiftUI

struct LibraryView: View {
    
    @EnvironmentObject var model: Model
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.librarySongs, id: \.self) {
                    song in
                   SongCardView(song: song)
                }
            }
            .navigationBarTitle(Text("Library"),displayMode: .automatic)
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
