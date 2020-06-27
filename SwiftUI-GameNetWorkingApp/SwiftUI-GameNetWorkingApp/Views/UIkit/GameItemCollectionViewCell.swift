//
//  GameItemCollectionViewCell.swift
//  SwiftUI-GameNetWorkingApp
//
//  Created by qjinliang on 2020/6/25.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import UIKit

class GameItemCollectionViewCell: UICollectionViewCell {
    static let reusedId = "GameItemId"
    var imageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    func configure( game: Game){
        let imageId = game.cover.imageId
        if !imageId.isEmpty {
            let url = URL(string: ImageBuilder(imageId: imageId))!
            imageView.downloadImage(url: url)
            imageView.backgroundColor = .yellow
        } else {
            imageView.image = nil
        }
    }
    
    private func setupCell(){
        contentView.addSubview(imageView)
        clipsToBounds = true
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImageView {
    func downloadImage(url : URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httResponse = response as? HTTPURLResponse, httResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil,
                let image = UIImage(data: data) else {
                    return
            }
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }
        .resume()
    }
}

