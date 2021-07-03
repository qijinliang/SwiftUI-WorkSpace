//
//  Neworkingimage.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/5/14.
//

import Foundation
import SwiftUI

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


struct URLImage: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
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
