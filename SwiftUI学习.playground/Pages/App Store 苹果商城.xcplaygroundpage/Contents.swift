//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("App Store")
                            .foregroundColor(.gray)
                            .bold()
                            .font(Font.footnote)
                        Text("SwiftUI").font(Font.largeTitle).bold()
                    }
                    Spacer()
                    
                    Button(action:self.loadProfile, label:  {
                        Image.init(systemName: "person.circle.fill").resizable()
                            .frame(width: 40, height: 40, alignment: .trailing)
                    })
                }.padding([.leading, .trailing, .top])
                
                HighlightView(catagory: "周杰伦", title: "生日：1979年1月18日", message: "职业：歌手、音乐人、导演、编剧、演员").frame(height: 550, alignment: .leading)
                HighlightView(catagory: "周杰伦", title: "生日：1979年1月18日", message: "职业：歌手、音乐人、导演、编剧、演员").frame(height: 550, alignment: .leading)
                HighlightView(catagory: "周杰伦", title: "生日：1979年1月18日", message: "职业：歌手、音乐人、导演、编剧、演员").frame(height: 550, alignment: .leading)
            }
        }
    }
    
    func loadProfile() {
        
    }
}


struct HighlightView: View {
    var catagory: String
    var title: String
    var message: String
    
    var body: some View {
        VStack {
            ZStack {
                 Image.init(uiImage: #imageLiteral(resourceName: "Jay2.jpg"))
                    .resizable()
                LinearGradient(gradient: Gradient(colors: [.clear,Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                
                VStack(alignment: .leading) {
                    Text(catagory).foregroundColor(.white).bold()
                    Text(title).foregroundColor(.white).font(Font.title).bold()
                    Spacer()
                    Text(message).foregroundColor(.white)
                }.padding()
            }
        }.cornerRadius(30)
            .padding().shadow(radius: 4)
    }
}


PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
