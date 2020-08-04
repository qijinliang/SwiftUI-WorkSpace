//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport



struct gameData: Identifiable {
    var id = UUID()
    var title = String()
    var image = UIImage()
    var subtitle = String()
}

struct GameStorage {
    var thisWeekGames = [gameData(id: UUID(), title: "Jay", image: #imageLiteral(resourceName: "胡歌.jpg"), subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: #imageLiteral(resourceName: "Jay2.jpg"), subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: #imageLiteral(resourceName: "Jay3.jpg"), subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: #imageLiteral(resourceName: "Jay.jpg"), subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: #imageLiteral(resourceName: "Jay4.jpg"), subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: #imageLiteral(resourceName: "Jay.jpg"), subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: #imageLiteral(resourceName: "胡歌.jpg"), subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: #imageLiteral(resourceName: "Jay.jpg"), subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: #imageLiteral(resourceName: "Jay.jpg"), subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: #imageLiteral(resourceName: "Jay.jpg"), subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: #imageLiteral(resourceName: "Jay.jpg"), subtitle: "周杰伦")]
}

struct ContentView: View {
    var gameStorage = GameStorage()
    var numberOfRows = 3
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("高仿App Store").font(Font.largeTitle).bold()
                    }
                    Spacer()
                    
                    Button(action:self.loadProfile, label:  {
                        Image.init(systemName: "person.circle.fill").resizable()
                            .frame(width: 40, height: 40, alignment: .trailing)
                    })
                }.padding([.leading, .trailing, .top])
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        FeaturedPostView(captionText: "更新", titleText: "周杰伦壁纸", subtitleText: "壁纸")
                        FeaturedPostView(captionText: "更新", titleText: "周杰伦壁纸", subtitleText: "壁纸")
                    }
                })
                Divider()
                HorizontalScrollView(items: self.gameStorage.thisWeekGames)
            }
        }
        
    }
    
    func loadProfile() {
        
    }
}

struct FeaturedPostView: View {
    
    var captionText: String
    var titleText: String
    var subtitleText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(captionText).font(.caption).foregroundColor(.blue)
            Text(titleText)
            Text(subtitleText).font(.subheadline).foregroundColor(.gray)
            Image.init(uiImage: #imageLiteral(resourceName: "Jay.jpg")).resizable().scaledToFill().frame(width:350, height: 250, alignment: .center)
                .cornerRadius(5)
        }.frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
            .padding()
    }
}


struct HorizontalScrollView: View {
    
    var items : [gameData]
    
    var body: some View {
        VStack {
            
            HStack {
                VStack {
                    Text("Jay").font(Font.system(size: 25)).bold()
                    Text("杰伦").font(Font.caption).foregroundColor(.gray)
                }
                Spacer()
                Button(action: self.seeAll, label: {Text("查看全部")})
            }.padding()
            ScrollView(.horizontal, showsIndicators: false) {
                ForEach(0 ..< 3) { row in
                    HStack {
                        
                        ForEach(0 ..< self.items.count / 3) { column in
                            GameCell(data: self.items[self.datermineCurrentCell(row: row, column: column)])
                        }
                    }
                }
            }
        }
    }
    
    func datermineCurrentCell(row: Int, column: Int) -> Int {
        return ((((column + 1) * 3) - row) - 1)
    }
    
    func seeAll() {
        
    }
}

struct GameCell: View {
    var data: gameData
    var hasInAppPurchass: Bool = true
    var body: some View  {
        HStack {
            
            Image.init(uiImage: data.image).resizable().scaledToFill().frame(width: 70, height: 70, alignment: .leading).cornerRadius(15)
            
            VStack(alignment: .leading) {
                Text(data.title).font(Font.system(size: 20))
                Text(data.subtitle).font(.system(size: 12)).foregroundColor(Color.gray)
            }
            Spacer()
            VStack(spacing: 5) {
                Button(action: self.get, label: {Text("获取").padding(EdgeInsets.init(top: 3, leading: 15, bottom: 3, trailing: 15))}).font(.system(size: 15)).background(Color.gray.opacity(0.3)).cornerRadius(15)
                if hasInAppPurchass == true {
                    Text("Appn内购").font(.system(size: 10)).foregroundColor(.gray)
                }
            }
        }.padding()
            .frame(width: 300, alignment: .leading)
    }
    func get() {
        
    }
}


PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
