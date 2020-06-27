//
//  GameStoreController.swift
//  SwiftUI-GameNetWorkingApp
//
//  Created by qjinliang on 2020/6/25.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct GameStoreController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) ->  UIViewController {
        let controller = UINavigationController(rootViewController:  MainViewController())
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

struct GameStoreController_Previews: PreviewProvider {
    static var previews: some View {
        GameStoreController()
        
    }
}
