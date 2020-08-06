
import SwiftUI
import PlaygroundSupport


struct Result: Identifiable {
    var id = UUID()
    var score: Int
}

struct ContentView: View {
    let results = [Result(score: 8), Result(score: 5), Result(score: 10)]
    let colors: [Color] = [.red, .green, .blue]
    
    
    var body: some View {
        HStack {
            VStack {
                ForEach(results) { result in
                    Text("Result: \(result.score)")
                }
            }
            .padding()
            Spacer()
            VStack(alignment: .leading) {
                ForEach(colors, id: \.self) { color in
                    Text(color.description.capitalized)
                        .padding()
                        .background(color)
                }
            }.padding()
        }
    }
}


PlaygroundPage.current.setLiveView(ContentView())
