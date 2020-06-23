//
//  ContentView.swift
//  SwiftUI-GuideLogin
//
//  Created by qjinliang on 2020/6/18.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    private let initialLaunchKey = "isInitialLaunch"
    
    var body: some View {
        VStack {
            
            if show || UserDefaults.standard.bool(forKey: initialLaunchKey) {
                LoginView().transition(.move(edge: .bottom))
            } else {
                PageViewContainer(viewControllers: Page.getAll.map({
                    UIHostingController(rootView: PageView(page: $0))}), presentSignupView: {
                        withAnimation{
                            self.show = true
                        }
                        UserDefaults.standard.set(true, forKey: self.initialLaunchKey)
                }).transition(.scale)
            }
        }.frame(maxWidth: .infinity)
            .background(Color.backgroundColor).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
