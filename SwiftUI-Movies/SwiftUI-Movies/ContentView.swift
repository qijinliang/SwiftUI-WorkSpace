//
//  ContentView.swift
//  SwiftUI-Movies
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct Movie: Identifiable, Hashable {
    let id = UUID.init()
    let name, imageName: String
}

struct ContentView: View {
    
    let movies: [[Movie]] = [
        [.init(name: "Deadpool 2", imageName: "1"),
         .init(name:"The Shap of Water", imageName: "2")],
        [.init(name: "Incredibles 2",imageName: "3"),
         .init(name: "Tomb Reider",imageName: "4")],
        [.init(name: "Deadpool 2", imageName: "1"),
         .init(name:"The Shap of Water", imageName: "2")],
        [.init(name: "Incredibles 2",imageName: "3"),
         .init(name: "Tomb Reider",imageName: "4")],
    ]
    
    var body: some View {
        GeometryReader { geo in

            VStack {
                HStack {
                    Text("LBTA Movies")
                        .font(.system(size: 20, weight: .semibold))
                }
                ScrollView {
                    VStack(spacing: 48) {
                        
                        ForEach(self.movies, id: \.self) { row in
                            HStack(spacing: 16) {
                                ForEach(row) { movie in
                                    MovieView(movie: movie, size: geo.size)
                                }
                            }
                        }
                        Spacer()
                    }.padding(.horizontal, 16)
                }
            }
        }
    }
}

struct MovieView: View {
    
    let movie: Movie
    let size: CGSize
    
    var body: some View {
        
        VStack(spacing: 8) {
            Image(movie.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: (size.width - 48) / 2, height: 250)
                .clipped()
                .cornerRadius(8)
                .shadow(radius: 10)
            Text(movie.name).font(.system(size: 15, weight: .bold))
            Button(action: {
                
            }) {
                Text("Buy Tickets")
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.red)
                    .cornerRadius(8)
                    .shadow(radius: 10)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
