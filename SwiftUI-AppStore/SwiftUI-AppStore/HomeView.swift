//
//  HomeView.swift
//  SwiftUI-AppStore
//
//  Created by qjinliang on 2020/8/2.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var gameStorage = GameStorage()
    var numberOfRows = 3
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("高仿App Store").font(Font.largeTitle).bold()
                    }
                    Spacer()
                    
                    Button(action:self.loadProfile, label:  {
                        Image.init(systemName: "person.circle.fill").resizable()
                            .frame(width: 40, height: 40, alignment: .trailing)
                    })
                }.padding([.leading, .trailing, .top])
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        FeaturedPostView(captionText: "更新", titleText: "周杰伦壁纸", subtitleText: "壁纸")
                        FeaturedPostView(captionText: "New Update", titleText: "The Sims Freeplay", subtitleText: "Bounjour from paris")
                        FeaturedPostView(captionText: "New Update", titleText: "The Sims Freeplay", subtitleText: "Bounjour from paris")
                    }
                })
                Divider()
                HorizontalScrollView(items: self.gameStorage.thisWeekGames)
            }
        }
        
    }
    
    func loadProfile() {
        
    }
}

struct GameStorage {
    var thisWeekGames = [gameData(id: UUID(), title: "Jay", image: "Jay", subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: "Jay2", subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: "Jay", subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: "Jay2", subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: "Jay", subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: "Jay", subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: "Jay", subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: "Jay", subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: "Jay", subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: "Jay", subtitle: "周杰伦"),gameData(id: UUID(), title: "Jay", image: "Jay", subtitle: "周杰伦")]
}

struct gameData: Identifiable {
    var id = UUID()
    var title = String()
    var image = String()
    var subtitle = String()
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
