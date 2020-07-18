//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct Movie: Identifiable, Hashable {
    let id = UUID.init()
    let name: String
    let imageName: UIImage
    
}



struct ContentView: View {
    
    @State var show = false
    
    let movies: [[Movie]] = [
        [.init(name: "赵小臭", imageName: #imageLiteral(resourceName: "赵小臭1.jpg")),
         .init(name: "赵小臭", imageName: #imageLiteral(resourceName: "赵小臭2.jpg"))],
        [.init(name: "赵小臭",imageName: #imageLiteral(resourceName: "赵小臭3.jpg")),
         .init(name: "赵小臭",imageName: #imageLiteral(resourceName: "赵小臭4.jpg")),
         .init(name: "赵小臭",imageName: #imageLiteral(resourceName: "赵小臭5.jpg"))]
    ]
    
    
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(self.movies, id: \.self) { row in
                            ForEach(row) { movie in
                                
                                MovieView(movie: movie, size: geo.size).onTapGesture {
                                    self.show.toggle()
                                }
                                
                            }
                        }
                        Spacer()
                    }.padding(.horizontal, 16)
                }
            }.sheet(isPresented: self.$show) {
                ShowView()
            }
        }
    }
}


struct MovieView: View {
    
    let movie: Movie
    let size: CGSize
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading ,spacing: 10) {
                
                Image(uiImage: self.movie.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (size.width) / 2, height: 250)
                    .clipped()
                    .cornerRadius(8)
                    .shadow(radius: 10)
                
                Text(self.movie.name)
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .offset(x: 10,y: -45)
                    .foregroundColor(Color.white)
            }
            
        }
    }
}


struct ShowMovie: Identifiable, Hashable {
    let id = UUID.init()
    let name: String
    let imageName: UIImage
    
}


struct ShowView: View {
    
    let showmovies: [[ShowMovie]] = [
        [.init(name: "赵小臭", imageName: #imageLiteral(resourceName: "赵小臭5.jpg")),
         .init(name:"赵小臭", imageName: #imageLiteral(resourceName: "赵小臭6.jpg"))],
        [.init(name: "赵小臭",imageName: #imageLiteral(resourceName: "赵小臭7.jpg")),
         .init(name: "赵小臭",imageName: #imageLiteral(resourceName: "赵小臭8.jpg"))],
        [.init(name: "赵小臭",imageName: #imageLiteral(resourceName: "赵小臭9.jpg")),
         .init(name: "赵小臭",imageName: #imageLiteral(resourceName: "赵小臭10.jpg"))],
        [.init(name: "赵小臭",imageName: #imageLiteral(resourceName: "赵小臭1.jpg")),
         .init(name: "赵小臭",imageName: #imageLiteral(resourceName: "赵小臭2.jpg"))]
    ]
    
    
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(self.showmovies, id: \.self) { row in
                            ForEach(row) { showmovie in
                                ShowMovieView(showmovie: showmovie, size: geo.size)
                            }
                        }
                        Spacer()
                    }.padding(.horizontal, 16)
                }
            }
        }
    }
}

struct ShowMovieView: View {
    
    let showmovie: ShowMovie
    let size: CGSize
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            Image(uiImage: self.showmovie.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: (size.width - 50) / 2, height: 250)
                .clipped()
                .cornerRadius(8)
                .shadow(radius: 10)
            Text(self.showmovie.name)
                .font(.system(size: 24))
                .fontWeight(.heavy)
                .offset(x: 10,y: -45)
                .foregroundColor(Color.white)
            
        }
    }
}


PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
