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
        [.init(name: "赵小臭", imageName: #imageLiteral(resourceName: "赵小臭9.jpg")),
         .init(name:"赵小臭", imageName: #imageLiteral(resourceName: "赵小臭10.jpg"))],
        [.init(name: "赵小臭",imageName: #imageLiteral(resourceName: "赵小臭3.jpg")),
         .init(name: "赵小臭",imageName: #imageLiteral(resourceName: "赵小臭4.jpg"))],
        [.init(name: "赵小臭", imageName: #imageLiteral(resourceName: "赵小臭5.jpg")),
         .init(name:"赵小臭", imageName: #imageLiteral(resourceName: "赵小臭6.jpg"))],
        [.init(name: "赵小臭",imageName: #imageLiteral(resourceName: "赵小臭7.jpg")),
         .init(name: "赵小臭",imageName: #imageLiteral(resourceName: "赵小臭8.jpg"))],
    ]
    
    
    var body: some View {
        NavigationView {
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
        .navigationBarTitle(Text("ScrollView"))
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
