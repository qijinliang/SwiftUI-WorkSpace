//
//  ScrollViewSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/11.
//

import SwiftUI

struct Movie: Identifiable, Hashable {
    let id = UUID.init()
    let name: String
    let imageName: UIImage
    
}


struct ScrollViewSwiftUIView: View {
    
    let movies: [[Movie]] = [
        [.init(name: "最爱的美食", imageName: #imageLiteral(resourceName: "美食5")),
         .init(name:"最爱的美食", imageName: #imageLiteral(resourceName: "美食8"))],
        [.init(name: "最爱的美食",imageName: #imageLiteral(resourceName: "美食2")),
         .init(name: "最爱的美食",imageName: #imageLiteral(resourceName: "美食3"))],
        [.init(name: "最爱的美食",imageName: #imageLiteral(resourceName: "美食4"))],
        [.init(name: "最爱的美食",imageName: #imageLiteral(resourceName: "美食8")),
         .init(name: "最爱的美食",imageName: #imageLiteral(resourceName: "美食6"))],
        [.init(name: "最爱的美食",imageName: #imageLiteral(resourceName: "美食7"))]
    ]
    
    
    var body: some View {

            GeometryReader { geo in
                
                VStack {
                    ScrollView {
                        VStack(spacing: 48) {
                            ForEach(self.movies, id: \.self) { row in
                                HStack(spacing: 16) {
                                    ForEach(row) { movie in
                                        MovieView(movie: movie, size: geo.size )
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
            Image(uiImage: self.movie.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: (size.width - 40) / 2, height: (size.height - 50) / 2)
                .clipped()
                .cornerRadius(8)
                .shadow(radius: 10)
            Text(movie.name).font(.system(size: 15, weight: .bold))
            Button(action: {
                
            }) {
                Text("点击喜欢")
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

struct ScrollViewSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScrollViewSwiftUIView()
        }
    }
}
