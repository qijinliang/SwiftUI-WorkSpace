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
        [.init(name: "车模1", imageName: #imageLiteral(resourceName: "1.jpg")),
         .init(name: "车模2", imageName: #imageLiteral(resourceName: "2.jpg"))],
        [.init(name: "车模3",imageName: #imageLiteral(resourceName: "3.jpg")),
         .init(name: "车模3",imageName: #imageLiteral(resourceName: "4.jpg"))]
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
        [.init(name: "车模", imageName: #imageLiteral(resourceName: "车模1.jpg")),
         .init(name:"车模", imageName: #imageLiteral(resourceName: "车模2.jpg"))],
        [.init(name: "车模",imageName: #imageLiteral(resourceName: "车模3.jpg")),
         .init(name: "车模",imageName: #imageLiteral(resourceName: "车模4.jpg"))],
        [.init(name: "车模",imageName: #imageLiteral(resourceName: "车模5.jpg")),
         .init(name: "车模",imageName: #imageLiteral(resourceName: "车模6.jpg"))],
        [.init(name: "车模",imageName: #imageLiteral(resourceName: "车模7.jpg")),
         .init(name: "车模",imageName: #imageLiteral(resourceName: "车模8.jpg"))]
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
