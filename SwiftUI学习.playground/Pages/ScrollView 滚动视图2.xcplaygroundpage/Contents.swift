//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct Card: Identifiable, Hashable {
    let id: Int
    let image: UIImage
    let title: String
    let subTitile: String
}


var data = [
    Card(id: 0, image: #imageLiteral(resourceName: "g1.png"), title: "游戏标题", subTitile: "游戏介绍"),
    Card(id: 1, image: #imageLiteral(resourceName: "g2.png"), title: "游戏标题", subTitile: "游戏介绍"),
    Card(id: 2, image: #imageLiteral(resourceName: "g3.png"), title: "游戏标题", subTitile: "游戏介绍"),
    Card(id: 3, image: #imageLiteral(resourceName: "g4.png"), title: "游戏标题", subTitile: "游戏介绍"),
    Card(id: 4, image: #imageLiteral(resourceName: "g5.png"), title: "游戏标题", subTitile: "游戏介绍"),
    Card(id: 5, image: #imageLiteral(resourceName: "g6.png"), title: "游戏标题", subTitile: "游戏介绍"),
    Card(id: 6, image: #imageLiteral(resourceName: "g7.png"), title: "游戏标题", subTitile: "游戏介绍"),
    Card(id: 7, image: #imageLiteral(resourceName: "g8.png"), title: "游戏标题", subTitile: "游戏介绍")
]


struct contentView: View {
    var body: some View {
        Home()
    }
}

struct Home : View {
    
    @State var time = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect()
    
    @State var show = false
    
    var body: some View{
        
        ZStack(alignment: .top, content: {
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack{
                    GeometryReader{g in
                        Image.init(uiImage: #imageLiteral(resourceName: "poster.png")).resizable()
                            .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0)
                            .frame(height: g.frame(in: .global).minY > 0 ? UIScreen.main.bounds.height / 2.2 + g.frame(in: .global).minY  : UIScreen.main.bounds.height / 2.2)
                            .onReceive(self.time) { (_) in
                                
                                let y = g.frame(in: .global).minY
                                
                                if -y > (UIScreen.main.bounds.height / 2.2) - 50{
                                    
                                    withAnimation{
                                        
                                        self.show = true
                                    }
                                }
                                else{
                                    
                                    withAnimation{
                                        
                                        self.show = false
                                    }
                                }
                                
                        }
                        
                    }
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                    
                    VStack{
                        
                        HStack{
                            
                            Text("2020年度游戏排行榜")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                
                                Text("查看全部")
                                    .fontWeight(.bold)
                            }
                        }
                        
                        VStack(spacing: 20){
                            
                            ForEach(data){i in
                                
                                CardView(data: i)
                            }
                        }
                        .padding(.top)
                    }
                    .padding()
                    
                    Spacer()
                }
            })
            
            if self.show{
                
                TopView()
            }
        })
            .edgesIgnoringSafeArea(.top)
    }
}


struct CardView : View {
    
    var data : Card
    
    var body: some View{
        
        HStack(alignment: .top, spacing: 20){
            
            Image.init(uiImage: self.data.image)
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text(self.data.title)
                    .fontWeight(.bold)
                
                Text(self.data.subTitile)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack(spacing: 12){
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("下载")
                            .fontWeight(.bold)
                            .padding(.vertical,10)
                            .padding(.horizontal,25)
                            .background(Color.primary.opacity(0.06))
                            .clipShape(Capsule())
                    }
                    
                    Text("应用程序")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
            }
            
            Spacer(minLength: 0)
        }
    }
}

struct TopView : View {
    
    var body: some View{
        
        HStack{
            
            VStack(alignment: .leading, spacing: 12) {
                
                HStack(alignment: .top){
                    
                    Image.init(uiImage: #imageLiteral(resourceName: "apple.png"))
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 25, height: 30)
                        .foregroundColor(.primary)
                    
                    Text("AppleStore")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Text("每个月12元")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer(minLength: 0)
            
            Button(action: {
                
            }) {
                
                Text("免费订阅")
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .padding(.horizontal, 25)
                    .background(Color.blue)
                    .clipShape(Capsule())
            }
        }
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top == 0 ? 15 : (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 5)
        .padding(.horizontal)
        .padding(.bottom)
        .background(BlurBG())
    }
}


struct BlurBG : UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
        
    }
}

PlaygroundPage.current.setLiveView(contentView())

//: [Next](@next)
