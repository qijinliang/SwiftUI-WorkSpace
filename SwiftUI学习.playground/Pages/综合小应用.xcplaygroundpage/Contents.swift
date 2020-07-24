//: [Previous](@previous)


//#imageLiteral(resourceName: "s1.jpg")
//#imageLiteral(resourceName: "s2.jpg")

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    @State var selected = "Games"
    var scorlllist = ["游戏","应用","预购","应用购买"]
    
    var body: some View {
        VStack(spacing: 15){
            HStack {
                Text("游戏商店")
                    .fontWeight(.heavy)
                    .font(.title)
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image.init(uiImage: #imageLiteral(resourceName: "search@3x.png")).renderingMode(.original)
                }
            }.padding(.top, 10)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(scorlllist, id: \.self) { i in
                        
                        Button(action: {
                            self.selected = i
                        }) {
                            Text(i).padding().foregroundColor(self.selected == i ? Color.black : Color.gray).overlay(
                                Capsule()
                                    .fill(self.selected == i ? Color.red : Color.clear)
                                    .frame(height: 5)
                                    .padding(.top, 30)
                            )
                        }
                        
                        
                    }
                }
            }
            middleView()
            bottomView()
        }.padding()
    }
}


struct Picutres: Identifiable, Hashable {
    let id = UUID.init()
    let imageName: UIImage
    
}


struct middleView: View {
    @State var show = false
    var imagelist = [#imageLiteral(resourceName: "s1.png"),#imageLiteral(resourceName: "s1.png"),#imageLiteral(resourceName: "s1.png")]
    
    let picutreModels: [[Picutres]] = [
        [.init(imageName: #imageLiteral(resourceName: "s1.png")),
         .init(imageName: #imageLiteral(resourceName: "s2.png"))],
        [.init(imageName: #imageLiteral(resourceName: "s3.png"))]
    ]
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 15) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(self.picutreModels, id: \.self) { row in
                            ForEach(row) { picutres in
                                PicutreView(movie: picutres, size: geo.size).onTapGesture {
                                    self.show.toggle()
                                }
                            }
                            
                        }
                    }
                }.padding(.vertical, 15)
                
                HStack(spacing: 15) {
                    
                    Button(action: {
                        
                    }) {
                        Image(uiImage: #imageLiteral(resourceName: "trophy.png")).renderingMode(.original)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image(uiImage: #imageLiteral(resourceName: "cards.png")).renderingMode(.original)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image(uiImage: #imageLiteral(resourceName: "puzzle.png")).renderingMode(.original)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image(uiImage: #imageLiteral(resourceName: "punch.png")).renderingMode(.original)
                    }
                }
            }.sheet(isPresented: self.$show) {
                ExpandView()
            }
        }
        
    }
}


struct PicutreView: View {
    
    let movie: Picutres
    let size: CGSize
    
    var body: some View {
        
        VStack(spacing: 15) {
            Image(uiImage: self.movie.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: (size.width), height: 180)
                .clipped()
                .cornerRadius(8)
                .shadow(radius: 10)
        }
        
    }
}

//弹出视图
struct ExpandView: View {
    var body: some View{
        Text("123")
    }
}

struct Detail : View {
    
    var body : some View{
        Text("Hello world")
    }
}



struct BottomPicutres: Identifiable, Hashable {
    let id = UUID.init()
    let name: String
    let prict: String
    let imageName: UIImage
    
}

struct bottomView: View {
    
    @State var show = false
    let bottompicutres: [[BottomPicutres]] = [
        [.init(name: "守护者", prict: "$29.99", imageName: #imageLiteral(resourceName: "h1.png")),
         .init(name: "王国骑士", prict: "$15.99", imageName: #imageLiteral(resourceName: "h2.png"))],
        [.init(name: "龙之英雄", prict: "$9.99", imageName: #imageLiteral(resourceName: "h3.png")),
         .init(name: "皇冠战争", prict: "$19.99", imageName: #imageLiteral(resourceName: "h4.png"))]
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 10) {
                Capsule().fill(Color.red).frame(width: 5, height: 25)
                Text("新款游戏")
                Spacer()
            }.padding(.vertical, 15)
            
            GeometryReader { geo in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(self.bottompicutres, id: \.self) { row in
                            ForEach(row) { picutres in
                                BottomViewView(movie: picutres, size: geo.size).onTapGesture {
                                    self.show.toggle()
                                }
                                
                            }
                            
                        }
                    }.sheet(isPresented: self.$show) {
                        
                        Detail()
                    }
                }
            }
        }
    }
}


struct BottomViewView: View {
    
    let movie: BottomPicutres
    let size: CGSize
    
    var body: some View {
        
        VStack(spacing: 15) {
            Image(uiImage: self.movie.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: (size.width)/4, height: 100)
                .clipped()
                .cornerRadius(8)
                .shadow(radius: 10)
            
            Image.init(uiImage: #imageLiteral(resourceName: "os.png"))
            Text(self.movie.name).foregroundColor(Color.red)
        }
        
    }
}


PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
