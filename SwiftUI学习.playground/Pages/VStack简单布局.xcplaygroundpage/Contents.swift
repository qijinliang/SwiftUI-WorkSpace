//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ContentView: View{
    var body: some View {
        VStack {
            VStack(alignment: .trailing, spacing: 10){
                VStack{
                    Text("我❤️")
                        .frame(width: 100, height: 30)
                        .foregroundColor(Color.white)
                }
                .padding()
                .background(Color.orange)
                
                
                
                VStack() {
                    Text("何艳婷")
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
        .debug()
    }
}
//检查body的实际类型，创建辅助函数
extension View {
    func debug()->Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
