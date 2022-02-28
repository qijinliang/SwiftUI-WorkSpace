//
//  DestionationHeaderContainer.swift
//  SwiftUI-Discover
//
//  Created by 金亮齐 on 2022/2/28.
//

import SwiftUI
import SDWebImageSwiftUI

struct DestionationHeaderContainer: UIViewControllerRepresentable {
    
    let imageNames: [String]
    
    func makeUIViewController(context: Context) -> UIViewController {
        let revVC = CustomPageViewController(imageNames: imageNames)
        return revVC
    }
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        allControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        if index == 0 { return nil }
        return allControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        if index == allControllers.count - 1 { return nil }
        return allControllers[index + 1]
    }
 
    var allControllers: [UIViewController] = []
    
    init(imageNames: [String]) {
        
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = .blue
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        allControllers = imageNames.map({ imageName in
            let hostingController = UIHostingController(rootView: WebImage(url: URL(string: imageName)).resizable().scaledToFill())
            hostingController.view.clipsToBounds = true
            return hostingController
        })
        
        setViewControllers([allControllers.first!], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
        self.delegate = self
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

