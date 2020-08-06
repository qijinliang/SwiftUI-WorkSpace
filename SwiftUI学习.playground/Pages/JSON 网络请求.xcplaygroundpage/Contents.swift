//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct Response: Decodable {
    var results: [Result]
}

struct Result: Decodable{
    var trackId: Int
    var trackName: String
    var collectionName: String
    var releaseDate: String
}

struct ContentView: View {
    
    @State var results = [Result]()
    
    var body: some View {
        NavigationView {
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    Text(item.trackName).font(.headline)
                    Text(item.collectionName).font(.subheadline)
                    Text(item.releaseDate).font(.caption).foregroundColor(.gray)
                }
            }.onAppear(perform: loadData)
                .navigationBarTitle(Text("网络请求"))
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invaild URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                    DispatchQueue.main.async {
                        self.results = decodedResponse.results
                    }
                    return
                } catch let jsonError as NSError {
                    print("JSON decode failed: \(jsonError.localizedDescription)")
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unkonw error")")
        }.resume()
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
