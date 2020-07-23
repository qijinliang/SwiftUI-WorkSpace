
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

struct HomeView: View {
    
    @State var index = 1
    @State var offset: CGFloat = UIScreen.main.bounds.width
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(spacing: 0) {
            
            AppBar(index: self.$index, offset: self.$offset)
            
            GeometryReader { g in
                HStack(spacing: 0) {
                    FirstView()
                        .frame(width: g.frame(in: .global).width)
                    //                    ScndView()
                    //                        .frame(width: g.frame(in: .global).width)
                    //                    ThirdView()
                    //                        .frame(width: g.frame(in: .global).width)
                }
                .offset(x: self.offset)
                .highPriorityGesture(DragGesture()
                .onEnded({ (value) in
                    if value.translation.width > 50 {
                        print("right")
                        self.changeView(left: false)
                    }
                    
                    if -value.translation.width > 50 {
                        print("left")
                        self.changeView(left: true)
                    }
                }))
            }
        }
        .animation(.default)
        .edgesIgnoringSafeArea(.all)
    }
    
    func changeView(left : Bool){
        
        if left{
            
            if self.index != 3{
                
                self.index += 1
            }
        }
        else{
            
            if self.index != 0{
                
                self.index -= 1
            }
        }
        
        if self.index == 1{
            
            self.offset = self.width
        }
        else if self.index == 2{
            
            self.offset = 0
        }
        else{
            
            self.offset = -self.width
        }
    }
}


struct AppBar: View {
    @Binding var index: Int
    @Binding var offset: CGFloat
    var width = UIScreen.main.bounds.width
    var BackColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    
    var body: some View{
        VStack(alignment: .leading, content: {
            Text("首页")
                .font(.title)
                .foregroundColor(.white)
                .padding(.leading)
                .padding(.bottom)
            
            HStack {
                Button(action: {
                    
                    self.index = 1
                    self.offset = self.width
                }) {
                    VStack(spacing: 8) {
                        HStack(spacing: 12) {
                            
                            Image(uiImage: #imageLiteral(resourceName: "Home.png")).foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.7))
                            
                            
                            Text("首页")
                                .foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.7))
                        }
                        Capsule()
                            .fill(self.index == 1 ? Color.white : Color.clear)
                            .frame(height: 4)
                    }
                }
                
                Button(action: {
                    
                    self.index = 2
                    self.offset = 0
                }) {
                    VStack(spacing: 8) {
                        HStack(spacing: 12) {
                            
                            Image(uiImage: #imageLiteral(resourceName: "Search.png")).foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.7))
                            
                            
                            Text("搜索")
                                .foregroundColor(self.index == 2 ? .white : Color.white.opacity(0.7))
                        }
                        Capsule()
                            .fill(self.index == 2 ? Color.white : Color.clear)
                            .frame(height: 4)
                    }
                }
                
                Button(action: {
                    
                    self.index = 3
                    self.offset = -self.width
                }) {
                    VStack(spacing: 8) {
                        HStack(spacing: 12) {
                            
                            Image(uiImage: #imageLiteral(resourceName: "Profile.png")).foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.7))
                            
                            
                            Text("我的")
                                .foregroundColor(self.index == 3 ? .white : Color.white.opacity(0.7))
                        }
                        Capsule()
                            .fill(self.index == 3 ? Color.white : Color.clear)
                            .frame(height: 4)
                    }
                }
                
                
            }
            
        })
            .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
            .padding(.horizontal)
            .padding(.bottom, 10)
            .background(Color(BackColor))
    }
}

struct FirstView: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing:0){
                
                ForEach(1...5,id: \.self){i in
                    Image(uiImage: #imageLiteral(resourceName: "赵小臭1.jpg"))
                        .resizable()
                        .frame(height: 250)
                        .cornerRadius(15)
                        .shadow(radius: 8)
                        .padding(.top)
                        .padding(.horizontal)
                }
            }
            
        }.padding(.bottom, 18)
    }
}

struct ScndView: View {
    var body: some View {
        Text("ScndView")
    }
}

struct ThirdView: View {
    var body: some View {
        Text("ThirdView")
    }
}

PlaygroundPage.current.setLiveView(ContentView())
