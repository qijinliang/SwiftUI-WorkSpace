//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct Movie: Identifiable, Hashable {
    let id = UUID.init()
    let name: String
    let imageName: UIImage
    
}


struct ContentView: View {
    
    let movies: [[Movie]] = [
        [.init(name: "车模", imageName: #imageLiteral(resourceName: "1.jpg")),
         .init(name:"车模", imageName: #imageLiteral(resourceName: "2.jpg"))],
        [.init(name: "车模",imageName: #imageLiteral(resourceName: "3.jpg")),
         .init(name: "车模",imageName: #imageLiteral(resourceName: "4.jpg"))]
    ]
    
    
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(self.movies, id: \.self) { row in
                            ForEach(row) { movie in
                                MovieView(movie: movie, size: geo.size)
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
                .frame(width: (size.width), height: 250)
                .clipped()
                .cornerRadius(8)
                .shadow(radius: 10)
        }
        
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
