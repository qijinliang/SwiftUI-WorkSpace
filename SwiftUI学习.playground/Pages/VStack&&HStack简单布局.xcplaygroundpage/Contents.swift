//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 0) {
                HStack {
                    HStack {
                        Text("上下布局")
                    }
                    .padding()
                    .background(Color.black)
                }
                .padding()
                .background(Color.purple)
                .frame(width: 150, height: 90, alignment: .center)
                
                
                HStack {
                    HStack {
                        Text("纵向布局")
                    }
                    .padding()
                    .background(Color.green)
                }
                .padding()
                .background(Color.purple)
                .frame(width: 150, height: 90, alignment: .center)
            }
            .padding()
            .background(Color.clear)
            .frame(width: 300, height: 90, alignment: .center)
            
            
            HStack(alignment: .top, spacing: 0) {
                
                HStack {
                    HStack {
                        Text("横向布局")
                    }
                    .padding()
                    .background(Color.orange)
                    
                }
                .padding()
                .background(Color.red)
                .frame(width: 150, height: 90, alignment: .center)
                
                HStack {
                    HStack {
                        Text("综合布局")
                    }
                    .padding()
                    .background(Color.blue)
                }
                    
                .padding()
                .background(Color.red)
                .frame(width: 150, height: 90, alignment: .center)
            }
            .padding()
            .background(Color.clear)
            .frame(width: 300, height: 90, alignment: .center)
        }
        .padding()
        .background(Color.white)
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
