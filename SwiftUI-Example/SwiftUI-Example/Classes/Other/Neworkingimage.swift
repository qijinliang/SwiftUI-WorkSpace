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
