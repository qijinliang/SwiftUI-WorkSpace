//
//  MainViewController.swift
//  Swift-NetWorking
//
//  Created by qjinliang on 2020/7/7.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false
        
        //创建子控制器
        setUpCtrls()
        
        // Do any additional setup after loading the view.
    }
    /// 创建子控制器
    func setUpCtrls() {
        
        /// 首页
        let homeVC = HomeController()
        addChildViewController(homeVC, title: "首页", image: "tab_home", selImage: "tab_home_S")
    }
    

    /// 添加子控制器
    ///
    /// - Parameters:
    ///   - VC: 子控制器
    ///   - title: 子控制器标题
    ///   - image: 正常状态下的图片
    ///   - selImage: 选中状态下的图片
    func addChildViewController(_ VC:UIViewController, title:String?, image:String?, selImage:String?) {
        
        VC.title = title
        let NorImg = UIImage.init(named: image!)
        let SelImg = UIImage.init(named: selImage!)
        VC.tabBarItem = UITabBarItem(title: nil, image: NorImg?.withRenderingMode(.alwaysOriginal), selectedImage: SelImg?.withRenderingMode(.alwaysOriginal))
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            VC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            
        }
        addChild(MainNavigationController(rootViewController: VC))
    }

}
