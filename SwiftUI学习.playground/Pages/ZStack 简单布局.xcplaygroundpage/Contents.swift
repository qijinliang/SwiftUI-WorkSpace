//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    var body: some View {
        
        ZStack{
            VStack(spacing: -30) {
                HStack(alignment: .top, spacing: -10) {
                    
                    VStack(spacing: 30) {
                        VStack() {
                            Text("图片")
                        }
                        .padding()
                        
                        Image.init(uiImage: #imageLiteral(resourceName: "4.jpg"))
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(8)
                            .shadow(radius: 10)
                            .frame(width: 150, height: 150)
                        
                    }
                    .padding()
                    
                    VStack(spacing: 30) {
                        VStack() {
                            Text("图片")
                        }
                        .padding()
                        
                        Image.init(uiImage: #imageLiteral(resourceName: "3.jpg"))
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(8)
                            .shadow(radius: 10)
                            .frame(width: 150, height: 150)
                        
                    }
                    .padding()
                }
                .padding()
                HStack(alignment: .top, spacing: -10) {
                    
                    VStack(spacing: 30) {
                        VStack() {
                            Text("图片")
                        }
                        .padding()
                        
                        Image.init(uiImage: #imageLiteral(resourceName: "2.jpg"))
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(8)
                            .shadow(radius: 10)
                            .frame(width: 150, height: 150)
                        
                    }
                    .padding()
                    
                    VStack(spacing: 30) {
                        VStack() {
                            Text("图片")
                        }
                        .padding()
                        
                        Image.init(uiImage: #imageLiteral(resourceName: "1.jpg"))
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(8)
                            .shadow(radius: 10)
                            .frame(width: 150, height: 150)
                        
                    }
                    .padding()
                }
            }
        }
        .padding()
        
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
