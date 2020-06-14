//
//  MainController.swift
//  SwiftUI-Facebook
//
//  Created by qjinliang on 2020/6/13.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI
import LBTATools
import UIKit

struct Post {
    let name: String
    let text: String
    let location: String
}

class PostCell: LBTAListCell<Post> {
    
    override var item: Post! {
        didSet {
            postTextLabel.text = item.text
            
            let attributedString = NSMutableAttributedString(string: "\(item.name)", attributes: [.font: UIFont.boldSystemFont(ofSize: 16)])
            
            attributedString.append(NSAttributedString(string: "❤️", attributes: [.font: UIFont.systemFont(ofSize: 16)]))
            attributedString.append(NSAttributedString(string: "\(item.location)", attributes: [.font: UIFont.systemFont(ofSize: 16)]))
            nameLable.attributedText = attributedString
        }
    }
    
    let nameLable = UILabel(text: "婷", font: .boldSystemFont(ofSize: 15),numberOfLines: 0)
    let dateLable = UILabel(text: "发布时间 11:12AM", font: .systemFont(ofSize: 12), textColor: .gray)
    let imageView = UIImageView(image: UIImage(named: "1"), contentMode: .scaleAspectFill)
    let photoImageView = UIImageView(image: UIImage(named: "1"), contentMode: .scaleAspectFill)
    let postTextLabel = UILabel(text: "本人漂亮的仙女照片", font: .systemFont(ofSize: 16), numberOfLines: 0)
    let photoGridController = PhotoGridController()
    
    
    override func setupViews() {
        super.setupViews()
        
        nameLable.textColor = UIColor.label
        postTextLabel.textColor = UIColor.label
        
        backgroundColor = UIColor(named: "cellBackgroundColor")
        
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 18
        
        stack(hstack(stack(imageView.withSize(.init(width: 36, height: 36)),UIView()),
                     stack(nameLable,dateLable, spacing: 2),
            spacing: 8)
            .withMargins(.init(top: 16, left: 16, bottom: 0, right: 16)).withHeight(70),
              
              stack(postTextLabel).padLeft(16).padRight(16).padTop(12),UIView().withHeight(12),
              photoGridController.view)
    }
}

class StoryHeader: UICollectionReusableView {
    
    let storiesController = StoriesController(scrollDirection: .horizontal)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        stack(storiesController.view).padTop(12).padBottom(12)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MainController: LBTAListHeaderController<PostCell, Post, StoryHeader>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.systemBackground
        
//        collectionView.backgroundColor = .init(white: 0.95, alpha: 1)
        
        items = [
            .init(name: "婷", text: "Occasionally I would look at the moon and imagine if you were by my side", location: "广东深圳"),
            .init(name: "亮",text: "You can't be caught in your hands, can't be written in your diary, can only keep your heart forever", location: "广东深圳"),
            .init(name: "亮",text: "You can't be caught in your hands, can't be written in your diary, can only keep your heart forever", location: "广东深圳"),
        ]
        collectionView.alwaysBounceVertical = true
        
        setupNavBar()
    }
    
    let fblogoImageView = UIImageView(image: UIImage(named: "NavgationTitle"), contentMode: .scaleAspectFit)
    let searchButton = UIButton(title: "search", titleColor: .black)
    
    fileprivate func setupNavBar() {
        
        let width = view.frame.width - 80 - 16 - 60
        let titleView = UIView(backgroundColor: .clear)
        titleView.frame = .init(x: 0, y: 0, width: width, height: 50)
        

        titleView.hstack(fblogoImageView.withWidth(80),
        UIView(backgroundColor: .clear).withWidth(width),
        searchButton.withWidth(60))
        navigationItem.titleView = titleView
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let safeAreaTop = UIApplication.shared.windows.filter
        {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0
        
        let magicalSafeAreaTop: CGFloat = safeAreaTop + (navigationController?.navigationBar.frame.height ?? 0)
        let offset = scrollView.contentOffset.y + magicalSafeAreaTop
        let alpha: CGFloat = 1 - ((scrollView.contentOffset.y + magicalSafeAreaTop) / magicalSafeAreaTop)
        
        fblogoImageView.alpha = alpha
        [fblogoImageView, searchButton].forEach {$0.alpha = alpha }
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 0, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt section: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 400)
    }
    
}


struct MainPreview: PreviewProvider {
    static var previews: some View {
        
        ForEach([ColorScheme.light, ColorScheme.dark], id: \.self) {
            scheme in
            PreviewView().edgesIgnoringSafeArea(.all)
                .environment(\.colorScheme, scheme)
        }
        

    }
    
    struct PreviewView: UIViewControllerRepresentable {
        
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.PreviewView>) -> UIViewController {
            
            return UINavigationController(rootViewController: MainController())
        }
        
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
    }
}
