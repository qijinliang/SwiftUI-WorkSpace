//
//  Json2SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/11.
//

import SwiftUI

struct RSS: Decodable {
    let feed: Feed2
}

struct Feed2: Decodable {
    let results: [Result]
}

struct Result: Decodable,Hashable {
    let artistName, name, artworkUrl100, releaseDate: String
}

class GridViewModel: ObservableObject {
    @Published var results = [Result]()
    init() {
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/cn/music/most-played/50/albums.json") else {
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
                GridItem(.adaptive(minimum: 160), spacing: 16)
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
            
            let url = URL(string: app.artworkUrl100)
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(22)
            } placeholder: {
                ProgressView()
            }
            Text(app.name)
                .font(.system(size: 10, weight: .semibold))
                .padding(.top, 4)
            Text(app.releaseDate)
                .font(.system(size: 9, weight: .regular))
            Text(app.artistName)
                .font(.system(size: 9, weight: .regular))
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct Json2SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Json2SwiftUIView()
    }
}
