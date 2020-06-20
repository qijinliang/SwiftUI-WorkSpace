//
//  ImageLoader.swift
//  SwiftUI-GameRank
//
//  Created by qjinliang on 2020/6/20.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation
import UIKit

let _imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    var imageCache = _imageCache
    
    func loadImage(with url: URL) {
        let urlString = url.absoluteURL
        
        if let imageFromCache = self.imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    return
                }
                self.imageCache.setObject(image, forKey: urlString as AnyObject)
                DispatchQueue.main.async { [weak self ] in
                    self?.image = image
                }
            }catch {
                print(error.localizedDescription)
            }
        }
    }
}
