import SwiftUI
import Combine


class AppleModel: ObservableObject {
    @Published var results: [AppRank] = []
    
    
    init() {
        guard let url = URL(string: "https://itunes.apple.com/rss/topGrossingApplications/limit=200/genre=6014/json?cc=cn") else {
            return
        }
        
        
        URLSession.shared.dataTask(with: url) {(data, resp, err) in
            guard let data = data else { return }
            do {
                let rss = try JSONDecoder().decode(AppRankM.self, from: data)
                DispatchQueue.main.async {
                    self.results = rss.feed.entry
                }
            }catch {
                print("Faild to decode: \(error)")
            }
        }.resume()
    }
}




struct NavigationSwiftUIView: View {
    
    @StateObject private var appRankModel = AppleModel()
    
    var body: some View {
        List {
            
            ForEach(appRankModel.results, id: \.imName.label) { item in
                NavigationLink(
                    destination: AppDetailView(
                        appId: item.id.attributes.imID, item: item)
                ) {
                    RankCellView(item: item)
                        .frame(height: 110)
                }
            }
        }
        .padding(.top, 75)
        .navigationBarTitle("App应用", displayMode: .inline)
        .edgesIgnoringSafeArea(.all)
    }
}

struct RankCellView: View {
    
    let item: AppRank
    
    var body: some View {
        HStack() {
            
            let url = URL(string: item.imImage.last?.label ?? "")
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .renderingMode(.original)
                    .cornerRadius(15)
                    .frame(width: 75, height: 75)
            } placeholder: {
                ProgressView()
            }
            
            
            VStack(alignment: .leading, spacing: 8.0) {
                
                Text(item.imName.label)
                    .font(.system(size: 20, weight: .bold))
                
                
                Text(item.category.attributes.label)
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                
                Text(item.imArtist.label).font(.footnote).lineLimit(1).foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}


struct AppDetailView: View {
    
    
    var appId: String
    var item: AppRank?
    
    var body: some View{
        List {
            VStack(spacing: 20) {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                Text("tete")
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct NavigationSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSwiftUIView()
    }
}
