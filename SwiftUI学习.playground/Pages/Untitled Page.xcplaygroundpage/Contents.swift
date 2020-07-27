//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

#colorLiteral(red: 0.976000011, green: 0.4709999859, blue: 0.4709999859, alpha: 1)
#colorLiteral(red: 0.9610000253, green: 0.3059999943, blue: 0.4199999869, alpha: 1)
#colorLiteral(red: 0.9607843137, green: 0.3058823529, blue: 0.4196078431, alpha: 1)

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color(#colorLiteral(red: 0.976000011, green: 0.4709999859, blue: 0.4709999859, alpha: 1)),Color(#colorLiteral(red: 0.9610000253, green: 0.3059999943, blue: 0.4199999869, alpha: 1)),Color(#colorLiteral(red: 0.9607843137, green: 0.3058823529, blue: 0.4196078431, alpha: 1))]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
        }
    }
}




PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
