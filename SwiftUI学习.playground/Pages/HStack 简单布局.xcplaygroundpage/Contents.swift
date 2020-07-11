
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        HStack{
            HStack{
                HStack(alignment: .top, spacing: 10) {
                    
                    HStack{
                        Text("左右对齐")
                            .foregroundColor(Color.black)
                            .frame(width: 100, height: 30)
                    }
                    .padding()
                    .background(Color.white)
                    
                    
                    
                    HStack {
                        Text("HStack布局")
                            .frame(width: 100, height: 30)
                        
                    }
                    .padding()
                    .background(Color.green)
                }
                .padding()
                .background(Color.blue)
            }
            .padding()
            .background(Color.orange)
        }
        .padding().background(Color.red)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
