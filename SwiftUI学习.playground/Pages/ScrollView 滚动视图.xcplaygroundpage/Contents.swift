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
    [.init(name: "车模", imageName: #imageLiteral(resourceName: "车模1.jpg")),
    .init(name:"车模", imageName: #imageLiteral(resourceName: "车模2.jpg"))],
    [.init(name: "车模",imageName: #imageLiteral(resourceName: "车模3.jpg")),
    .init(name: "车模",imageName: #imageLiteral(resourceName: "车模4.jpg"))],
    [.init(name: "车模", imageName: #imageLiteral(resourceName: "车模5.jpg")),
    .init(name:"车模", imageName: #imageLiteral(resourceName: "车模6.jpg"))],
    [.init(name: "车模",imageName: #imageLiteral(resourceName: "车模7.jpg")),
    .init(name: "车模",imageName: #imageLiteral(resourceName: "车模8.jpg"))],
    ]
    
    
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                HStack {
                    Text("图片加载")
                        .font(.system(size: 20, weight: .semibold))
                }
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
                .frame(width: (size.width - 50) / 2, height: 250)
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

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
