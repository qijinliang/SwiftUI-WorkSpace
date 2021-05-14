//
//  Json2SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/11.
//

import SwiftUI

struct RSS: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let results: [Result]
}

struct Result: Decodable,Hashable {
    let copyright, name, artworkUrl100, releaseDate: String
}

class GridViewModel: ObservableObject {
    @Published var results = [Result]()
    init() {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/50/explicit.json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, resp, err) in
            guard let data = data else { return }
            do {
                let rss = try JSONDecoder().decode(RSS.self, from: data)
                print(rss)
                self.results = rss.feed.results
            }catch {
                print("Faild to decode: \(error)")
            }
        }.resume()
    }
}




struct Json2SwiftUIView: View {
    @ObservedObject var vm = GridViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16),
            ], alignment: .leading ,spacing: 16, content: {
                ForEach(vm.results, id: \.self) { app in
                    AppInfo(app: app)
                }
            }).padding(.horizontal, 12)
        }
    }
}

struct AppInfo: View {
    
    let app: Result
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            URLImage(url: app.artworkUrl100)
                .scaledToFit()
                .cornerRadius(22)
            
            Text(app.name)
                .font(.system(size: 10, weight: .semibold))
                .padding(.top, 4)
            Text(app.releaseDate)
                .font(.system(size: 9, weight: .regular))
            Text(app.copyright)
                .font(.system(size: 9, weight: .regular))
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct URLImage2: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placehloder: String = "placeholder") {
        self.url = url
        self.placeholder = placehloder
        self.imageLoader.downloadImgae(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).renderingMode(.original).resizable()
        } else{
            return Image("placeholder").renderingMode(.original).resizable()
        }
    }
}



struct Json2SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Json2SwiftUIView()
    }
}
