//: [Previous](@previous)


import SwiftUI
import PlaygroundSupport

var data = ["Home","Orders","Wishlist","Saved Cards","Settings","Help"]

struct ContentView: View {
    
    @State var index = "Home"
    @State var show = false
    
    var body: some View {
        ZStack {
            (self.show ? Color.black.opacity(0.05) : Color.clear).edgesIgnoringSafeArea(.all)
            ZStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 25){
                    HStack(spacing: 15) {
                        Image.init(uiImage: #imageLiteral(resourceName: "胡歌.jpg"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .cornerRadius(40)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("胡歌")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("上海")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }
                        
                        Spacer()
                        Button(action: {
                            withAnimation(.spring()) {
                                self.show.toggle()
                            }
                            
                        }) {
                            
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                        }.padding()
                            .opacity(self.show ? 1 : 0)
                    }
                    .padding(.bottom, 50)
                    
                    
                    ForEach(data, id: \.self) { i in
                        Button(action: {
                            self.index = i
                            withAnimation(.spring()) {
                                self.show.toggle()
                            }
                        }) {
                            HStack {
                                Capsule()
                                    .fill(self.index == i ? Color.orange : Color.clear)
                                    .frame(width: 5, height: 30)
                                Text(i)
                                    .padding(.leading)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.leading)
                .padding(.top)
                .scaleEffect(self.show ? 1 : 0)
                
                ZStack(alignment: .topLeading) {
                    MainView(show: self.$show, index: self.$index)
                        .scaleEffect(self.show ? 0.8 : 1)
                        .offset(x: self.show ? 150 : 0, y: self.show ? 50 : 0)
                        .disabled(self.show ? true : false)
                }
            }
        }
    }
}

struct MainView: View {
    
    @Binding var show: Bool
    @Binding var index: String
    
    var body: some View {
        VStack(spacing: 0){
            ZStack {
                HStack{
                    
                    Button(action: {
                        withAnimation(.spring()) {
                            self.show.toggle()
                        }
                        
                    }) {
                        Image.init(uiImage: #imageLiteral(resourceName: "Menu.png"))
                            .resizable()
                            .frame(width: 20, height: 15)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image.init(uiImage: #imageLiteral(resourceName: "menudot.png"))
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.black)
                    }
                    
                }
                Text("Home")
                    .fontWeight(.bold)
                    .font(.title)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            ZStack {
                Home().opacity(self.index == "Home" ? 1 : 0)
                
                Orders().opacity(self.index == "Orders" ? 1 : 0)
                
                Wishlist().opacity(self.index == "Wishlist" ? 1 : 0)
                
                SavedCards().opacity(self.index == "Saved Cards" ? 1 : 0)
                
                Settings().opacity(self.index == "Settings" ? 1 : 0)
                
                Help().opacity(self.index == "Help" ? 1 : 0)
            }
            
        }.background(Color.white)
            .cornerRadius(15)
    }
}

struct Home: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 18) {
                Image.init(uiImage: #imageLiteral(resourceName: "胡歌.jpg"))
                    .resizable()
                    .frame(height: 250)
                    .cornerRadius(10)
                .shadow(radius: 8)
            }.padding(.top, 8)
                .padding(.horizontal)
        }
    }
}

struct Orders : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Orders")
            }
        }
    }
}

struct Wishlist : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Wishlist")
            }
        }
    }
}

struct SavedCards : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Saved Cards")
            }
        }
    }
}

struct Settings : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Settings")
            }
        }
    }
}

struct Help : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Help")
            }
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
