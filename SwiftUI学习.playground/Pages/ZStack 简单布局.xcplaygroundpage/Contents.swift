//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    var body: some View {
        
        ZStack {
            ZStack{
                ZStack {
                    ZStack{
                        Text("ZStack布局")
                            .foregroundColor(Color.black)
                    }
                    .padding()
                    .background(Color.white)
                }
                .padding()
                .background(Color.blue)
            }
            .padding()
            .background(Color.orange)
        }
        .padding()
        .background(Color.red)
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
