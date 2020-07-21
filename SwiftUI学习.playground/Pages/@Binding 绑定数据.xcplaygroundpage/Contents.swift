//: [Previous](@previous)

//#imageLiteral(resourceName: "赵小臭1.jpg")
import SwiftUI
import PlaygroundSupport


struct ContentView: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        HomeView(showProfile: $showProfile)
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0, z: 0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
    }
}


struct HomeView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack() {
            HStack() {
                Text("点击头像")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                
            }
            ShowView(showProfile: $showProfile)
            .padding(.horizontal)
            .padding(.top, 30)
            
            Spacer()
        }
    }
}

struct ShowView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        Button(action: {
            self.showProfile.toggle()
        }) {
            Image(uiImage: #imageLiteral(resourceName: "赵小臭5.jpg"))
                .renderingMode(.original)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
