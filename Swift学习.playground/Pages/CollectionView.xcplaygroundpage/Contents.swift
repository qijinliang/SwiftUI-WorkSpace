//: [Previous](@previous)

import UIKit
import PlaygroundSupport

//获取屏幕的宽高
let kScreenH = UIScreen.main.bounds.size.width
let KScreenW = UIScreen.main.bounds.size.width

private let kEdgeMargin: CGFloat = 10
private let kItemW: CGFloat = (KScreenW - 3 * kEdgeMargin) / 2
private let kItemH: CGFloat = kItemW * 3 / 4
private let kCellID = "kCellID"

class CollectionViewCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kItemW / 2, height: kItemH))
        imageView.contentMode = .scaleToFill
        let imag = UIImage(named: "CollectionCellimge.jpeg")
        imageView.image = imag
        self.addSubview(imageView)
    }
    
}

class CollectionView: UIViewController {
    
    // MARK - 懒加载
    fileprivate lazy var collectionView: UICollectionView = {[unowned self] in
        //创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemH
        layout.headerReferenceSize = CGSize(width: KScreenW, height: 50)
        //创建UICollectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: kCellID)
        collectionView.dataSource = self
        
        return collectionView
        }()
    
    override func viewDidLoad() {
        
        
        self.view.addSubview(collectionView)
        
        super.viewDidLoad()
    }
}


extension CollectionView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 2 {
            return 2
        }
        return 4
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellID, for: indexPath)
        cell.backgroundColor = UIColor.purple
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: kItemW, height: kItemH)
    }
}

PlaygroundPage.current.liveView = CollectionView()

//: [Next](@next)
