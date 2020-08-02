//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                        VStack {
                            
                            Image.init(uiImage: #imageLiteral(resourceName: "赵小臭6.jpg"))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                                .shadow(radius: 8)
                            Text("123")
                                .font(.title)
                                .fontWeight(.bold)
                        }.padding()
                        
                        VStack {
                            
                            Image.init(uiImage: #imageLiteral(resourceName: "赵小臭6.jpg"))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                                .shadow(radius: 8)
                            Text("123")
                                .font(.title)
                                .fontWeight(.bold)
                        }.padding()
                        
                        VStack {
                            
                            Image.init(uiImage: #imageLiteral(resourceName: "赵小臭6.jpg"))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                                .shadow(radius: 8)
                            Text("123")
                                .font(.title)
                                .fontWeight(.bold)
                        }.padding()
                    }
                }
                Spacer()
            }
            
            
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
