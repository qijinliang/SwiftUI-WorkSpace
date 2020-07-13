//
//  StoriesController.swift
//  SwiftUI-Facebook
//
//  Created by qjinliang on 2020/6/13.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI
import LBTATools
import UIKit

struct Story {
    let imageName: String
}

class StoryCell: LBTAListCell<Story> {
    
    override var item: Story! {
        didSet {
            imageView.image = UIImage(named: item.imageName)
        }
    }
    
    let imageView = UIImageView(image: UIImage(named: "11"), contentMode: .scaleAspectFill)
    let avatarImageView = CircularImageView(width: 36, image: UIImage(named: "3"))
    let nameLabel = UILabel(text: "齐金亮", font: .systemFont(ofSize: 13, weight: .bold), textColor: .white)

    override func setupViews() {
        stack(imageView)
        setupGradient()
        
        avatarImageView.backgroundColor = .red
        avatarImageView.layer.borderWidth = 2
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        
        layer.cornerRadius = 8
        clipsToBounds = true
        
        addSubview(avatarImageView)
        avatarImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 8, bottom: 0, right: 0))
        
        stack(UIView(), nameLabel).withMargins(.allSides(12))
        
        nameLabel.setupShadow(opacity: 0.8, radius: 1, offset: .init(width: 1, height: 1), color: .init(white: 0, alpha: 1))
        

    }
    
    let gradientLayer = CAGradientLayer()
    
    fileprivate func setupGradient() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.7, 1.1]
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
}

class StoriesController: LBTAListController<StoryCell, Story>, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt section: IndexPath) -> CGSize {
        return .init(width: 80, height: view.frame.height - 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .allSides(16)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = [
            .init(imageName: "11"),
            .init(imageName: "8"),
            .init(imageName: "2"),
        ]
        collectionView.backgroundColor = UIColor.systemBackground
        collectionView.alwaysBounceVertical = true
    }
}




struct StoryPreview: PreviewProvider {
    static var previews: some View {
        PreviewView().edgesIgnoringSafeArea(.all)
    }
    
    struct PreviewView: UIViewControllerRepresentable {
        
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<StoryPreview.PreviewView>) -> UIViewController {
            
            return StoriesController(scrollDirection: .horizontal)
        }
        
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
    }
}
