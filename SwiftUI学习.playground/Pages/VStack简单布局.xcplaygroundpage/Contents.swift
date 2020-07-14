//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ContentView: View{
    var body: some View {
        VStack {
            VStack(alignment: .trailing, spacing: 10){
                VStack{
                    Text("我")
                        .frame(width: 100, height: 30)
                        .foregroundColor(Color.white)
                }
                .padding()
                .background(Color.orange)
                
                VStack() {
                    Text("图片")
                        .frame(width: 100, height: 30)
                        .foregroundColor(Color.white)
                }
                .padding()
                .background(Color.purple)
            }
            .padding()
            .background(Color.white)
        }
        .padding()
        .background(Color.blue)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
