//
//  PhotoGridController.swift
//  SwiftUI-Facebook
//
//  Created by qjinliang on 2020/6/13.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI
import LBTATools
import UIKit

struct Photo {
    let imageName: String
}

class GridCell: LBTAListCell<Photo> {
    
    override var item: Photo! {
        didSet {
            imageView.image = UIImage(named: item.imageName)
        }
    }
    
    let imageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
    
    override func setupViews() {
        super.setupViews()

        stack(imageView)
    }
}

class PhotoGridController: LBTAListController<GridCell, Photo>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isScrollEnabled = false
        
        items = [
            Photo(imageName: "11"),
            Photo(imageName: "2"),
            Photo(imageName: "3"),
            Photo(imageName: "4"),
            Photo(imageName: "5"),
            Photo(imageName: "6"),
            Photo(imageName: "7"),
        ]
        collectionView.backgroundColor = .lightGray
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if indexPath.item == 0 || indexPath.item == 1 {
            return .init(width: (view.frame.width - 4 * 3) / 2, height: view.frame.height / 2)
        }
        return CGSize(width: (view.frame.width - 4.1 * 4) / 3, height: view.frame.height / 2)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 4, bottom: 0, right: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }

}




struct PhotoGridreview: PreviewProvider {
    static var previews: some View {
        PreviewView()
    }
    
    struct PreviewView: UIViewControllerRepresentable {
        
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoGridreview.PreviewView>) -> UIViewController {
            
            return PhotoGridController()
        }
        
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
    }
}
