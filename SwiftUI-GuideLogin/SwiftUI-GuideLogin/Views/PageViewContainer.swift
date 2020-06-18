//
//  PageViewContainer.swift
//  SwiftUI-GuideLogin
//
//  Created by qjinliang on 2020/6/18.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct PageViewContainer <T: View> : View{
    
    var viewControllers: [UIHostingController<T>]
    @State var currentPage = 0
    
    var body: some View {
        return VStack {
            PageViewController(controllers: viewControllers, currentPage: self.$currentPage)
            PageIndicator(currentIndex: self.currentPage)
            
            LCButton(text: currentPage == viewControllers.count - 1 ? "Get staret" : "Next") {
                if self.currentPage < self.viewControllers.count - 1 {
                    self.currentPage += 1
                }
            }.padding()
        }.background(Color.backgroundColor)
    }
}

struct PageViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        PageViewContainer(viewControllers: Page.getAll.map({
            UIHostingController(rootView: PageView(page: $0))
        }))
    }
}
