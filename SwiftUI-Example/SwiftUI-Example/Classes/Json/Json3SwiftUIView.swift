//
//  Json3SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/11.
//

import SwiftUI

struct Json3ResultData: Decodable {
    var code: Int
    var data: Json3Data_Code
}

struct Json3Data_Code: Decodable {
    var stateCode: Int
    var message: String
    var returnData: Json3ReturnData
}

struct Json3ReturnData: Decodable {
    var rankinglist: [Json3Rankinglist]
}

struct Json3Rankinglist: Decodable {
    var title: String
    var subTitle: String
    var cover: String
    var argName: String
    var argValue: String
    var rankingType: String
}

struct Json3SwiftUIView: View {
    
    @State var rankinglists = [Json3Rankinglist]()
    var body: some View {
        List(rankinglists, id: \.argValue) { item in
            VStack(alignment: .leading) {
                
                Text(item.rankingType).font(.title3).fontWeight(.bold)
                Text(item.subTitle).font(.subheadline).foregroundColor(.gray)
                URLImage(url: item.cover)
                    .frame(width: 320, height: 200)
                    .scaledToFill()
                    .shadow(radius: 8)
                    .cornerRadius(10)
                    .scaleEffect(0.95)
                
            }.padding()
            
        }.onAppear(perform: self.loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "http://app.u17.com/v3/appV3_3/ios/phone/rank/list") else {
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let jsonDecode = try JSONDecoder().decode(Json3ResultData.self, from: data)
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

struct Json3URLImage: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = Json3ImageLoader()
    
    //String = "placeholder" 加载失败需要替换的图片
    init(url: String, placehloder: String = "") {
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

class Json3ImageLoader: ObservableObject {
    
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
struct Json3SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Json3SwiftUIView()
    }
}
