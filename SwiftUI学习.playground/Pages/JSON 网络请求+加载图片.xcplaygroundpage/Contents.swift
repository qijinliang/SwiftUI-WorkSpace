//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ResultData: Decodable {
    var code: Int
    var data: Data_Code
}

struct Data_Code: Decodable {
    var stateCode: Int
    var message: String
    var returnData: ReturnData
}

struct ReturnData: Decodable {
    var rankinglist: [Rankinglist]
}

struct Rankinglist: Decodable {
    var title: String
    var subTitle: String
    var cover: String
    var argName: String
    var argValue: String
    var rankingType: String
}

struct ContentView: View {
    
    @State var rankinglists = [Rankinglist]()
    
    var body: some View {
        NavigationView {
            
            List(rankinglists, id: \.argValue) { item in
                VStack(alignment: .leading) {
                    
                    Text(item.rankingType).font(.title).fontWeight(.bold)
                    Text(item.subTitle).font(.subheadline).foregroundColor(.gray)
                    URLImage(url: item.cover).scaledToFill().shadow(radius: 8).cornerRadius(10)
                }.padding()
                
            }.onAppear(perform: self.loadData)
                .navigationBarTitle("JSON请求")
        }
    }
    
    func loadData() {
        guard let url = URL(string: "http://app.u17.com/v3/appV3_3/ios/phone/rank/list") else {
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let jsonDecode = try JSONDecoder().decode(ResultData.self, from: data)
                    let returnDataJson = jsonDecode.data.returnData
                    DispatchQueue.main.async {
                        self.rankinglists = returnDataJson.rankinglist
                    }
                    print("jsonDecode----->\(String(describing: returnDataJson))")
                    return
                } catch let jsonError as NSError {
                    print("jsonError faild",jsonError.localizedDescription)
                    return
                }
            }
            print("Fialid:\(String(describing: error?.localizedDescription))")
        }.resume()
    }
}

struct URLImage: View {
    
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

class ImageLoader: ObservableObject {
    
    @Published var downloadedData: Data?
    
    func downloadImgae(url: String) {
        
        guard let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in

            guard let data = data, error == nil else {
                return
            }

            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
