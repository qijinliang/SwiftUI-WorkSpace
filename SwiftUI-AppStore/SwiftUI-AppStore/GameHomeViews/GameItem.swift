//
//  GameItem.swift
//  SwiftUI-GameRank
//
//  Created by qjinliang on 2020/6/20.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct GameItem: View {
    let game: Game
    @ObservedObject var imageLoader = ImageLoader()
    var body: some View {
        HStack {
            ZStack {
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!).resizable()
                    .frame(width: 80, height: 80)
                        .foregroundColor(Color.black.opacity(0.1))
                    .cornerRadius(8)
                }else {
                    
                    Rectangle().frame(width: 80, height: 80)
                        .foregroundColor(Color.black.opacity(0.1))
                    .cornerRadius(8)
                        .onAppear{
                            self.imageLoader.loadImage(with: URL(string: self.game.artworkUrl100)!)
                    }
                }

            }
            
            VStack(alignment: .leading) {
                Text(game.artistName).bold()
                Group {
                    Text(game.name)
                    Text(game.genresText)
                    Text(game.releaseDate)
                }.foregroundColor(.secondary)
                    .font(.system(size: 14))
            }
            
            Spacer()
            
            Button(action: {
                
            }) {
                Text("免费")
                    .foregroundColor(Color.blue)
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(Capsule())
            }
        }
        .padding()
    }
}

struct GameItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameItem(game: Game.stubbed.first!)
        }.background(Color(red: 237/255, green: 237/255, blue: 227/255))
    }
}
