//: [Previous](@previous)


//#imageLiteral(resourceName: "s1.jpg")
//#imageLiteral(resourceName: "s2.jpg")
//#imageLiteral(resourceName: "s3.png")
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

struct middleView: View {
    @State var show = false
    var imagelist = [#imageLiteral(resourceName: "s1.png"),#imageLiteral(resourceName: "s1.png"),#imageLiteral(resourceName: "s1.png")]
    var body: some View {
        
        VStack(spacing: 15) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(imagelist, id: \.self) { _ in
                        Image.init(uiImage: #imageLiteral(resourceName: "s1.png")).renderingMode(.original).onTapGesture {
                            self.show.toggle()
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




struct bottomView: View {
    
    @State var show = false
    struct type: Identifiable {
        var id: Int
        var name: String
        var price: String
        var image: UIImage
    }
    
    var bottomlist = [type(id: 0, name: "守护者", price: "$29.99",image: #imageLiteral(resourceName: "h1.png")),
                      type(id: 1, name: "王国骑士", price: "$15.99",image: #imageLiteral(resourceName: "h2.png")),
                      type(id: 2, name: "龙之英雄", price: "$9.99",image: #imageLiteral(resourceName: "h3.png")),
                      type(id: 3, name: "皇冠战争", price: "$19.99",image: #imageLiteral(resourceName: "h4.png"))]
    
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 10) {
                Capsule().fill(Color.red).frame(width: 5, height: 25)
                Text("新款游戏")
                Spacer()
                Text("->").foregroundColor(Color.red)
            }.padding(.vertical, 15)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(bottomlist) { i in
                        VStack(alignment: .leading, spacing: 8) {
                            Image(uiImage: #imageLiteral(resourceName: "h1.png")).renderingMode(.original).onTapGesture {
                                self.show.toggle()
                            }
                            Text(i.name)
                            Image.init(uiImage: #imageLiteral(resourceName: "os.png"))
                            Text(i.price).foregroundColor(Color.red)
                        }
                    }
                }.sheet(isPresented: $show) {
                    
                    Detail()
                }
            }
        }
    }
}



PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
