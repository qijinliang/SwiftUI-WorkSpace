
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    @State var show = false
    
    var body: some View {
        HStack {
            
            VStack {
                BlueView().onTapGesture {
                    self.show.toggle()
                }
                RedView()
                purpleView()
            }.onTapGesture {
                self.show.toggle()
            }
        }.sheet(isPresented: self.$show) {
            showView()
        }
        
    }
}

struct BlueView: View {
    var body: some View {
        HStack {
            Image(uiImage: #imageLiteral(resourceName: "赵小臭8.jpg"))
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 200)
            Spacer()
        }
        .frame(width: 300, height: 220)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(x: 0, y: -20)
    }
}

struct RedView: View {
    var body: some View {
        HStack {
            Image(uiImage: #imageLiteral(resourceName: "赵小臭10.jpg"))
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 200)
            Spacer()
        }
        .frame(width: 300, height: 220)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(x: 0, y: -20)
    }
}

struct purpleView: View {
    var body: some View {
        HStack {
            Image(uiImage: #imageLiteral(resourceName: "赵小臭4.jpg"))
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 200)
            Spacer()
        }
        .frame(width: 300, height: 220)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(x: 0, y: -20)
    }
}

struct showView: View {
    var body: some View {
        HStack {
            Image(uiImage: #imageLiteral(resourceName: "赵小臭3.jpg"))
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 600)
                .shadow(radius: 8)
                .cornerRadius(10)
        }
        .padding()
    }
}

PlaygroundPage.current.setLiveView(ContentView())
