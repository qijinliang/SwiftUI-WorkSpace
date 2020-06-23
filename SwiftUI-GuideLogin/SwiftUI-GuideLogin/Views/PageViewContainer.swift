//
//  PageViewContainer.swift
//  SwiftUI-GuideLogin
//
//  Created by qjinliang on 2020/6/18.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct PageViewContainer<Page: View>  : View {
    
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    @State var buttonText = "下一页"
    var presentSignupView: (()->()) = {}
    
        
    var body: some View {
       
       return VStack {
        PageViewController(controllers: viewControllers, currentPage: self.$currentPage)
            
            PageIndicator(currentIndex: self.currentPage)
            
           VStack {
                
                Button(action: {
                    if self.currentPage < self.viewControllers.count - 1{
                        self.currentPage += 1
                    } else {
                        self.presentSignupView()
                    }
                }) {
                    HStack {
                        Text(currentPage == viewControllers.count - 1 ? "开始" : "下一页" )
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .accentColor(Color.white)
                            .background(Color("accentColor"))
                            .cornerRadius(30)
                    }.padding()
                }
            }.padding(.vertical)
        }.background(Color.backgroundColor)
    }
}

struct PageViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        PageViewContainer( viewControllers: Page.getAll.map({  UIHostingController(rootView: PageView(page: $0) )  }))
    }
}
