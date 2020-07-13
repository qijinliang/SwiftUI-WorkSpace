//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct LoadingError: Error {}

final class Remote<A>: ObservableObject {
    @Published var result: Result<A, Error>? = nil
    var value: A? { try? result?.get() }
    
    let url: URL
    let transform: (Data) -> A?
    
    init(url: URL, transform: @escaping (Data) -> A?) {
        self.url = url
        self.transform = transform
    }
    
    func load() {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                if let d = data, let v = self.transform(d) {
                    self.result = .success(v)
                }else {
                    self.result = .failure(LoadingError())
                }
            }
        }.resume()
    }
}

struct Photo : Codable, Identifiable {
    var id: String
    var author: String
    var width, height: Int
    var url, download_url: URL
}


struct ContentView: View {
    
    @ObservedObject var items = Remote(
        url: URL(string: "https://picsum.photos/v2/list")!,
        transform: {
            try? JSONDecoder().decode([Photo].self, from: $0)}
        
    )
    
    var body: some View {
        return NavigationView {
            if items.value == nil {
                Text("Loading....")
                    .onAppear {self.items.load() }
            }else {
                NavigationView{
                    List {
                        ForEach(items.value!) { photo in
                            NavigationLink(destination: PhotoView(photo.download_url), label: {
                                HStack {
                                    Text("作者：")
                                        .font(.title)
                                    Text(photo.author)
                                }.padding()
                                
                            })
                        }
                    }
                    .navigationBarTitle(Text("网络请求"))
                }
            }
        }
    }
}

struct PhotoView: View {
    @ObservedObject var image: Remote<UIImage>
    
    init(_ url: URL) {
        image = Remote(url: url, transform: { UIImage(data: $0)})
    }
    
    var body: some View {
        return Group {
            if image.value == nil {
                Text("Loading...").onAppear {self.image.load()}
            } else {
                Image(uiImage: image.value!)
                    .resizable()
                    .aspectRatio(image.value!.size, contentMode: .fit)
            }
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
