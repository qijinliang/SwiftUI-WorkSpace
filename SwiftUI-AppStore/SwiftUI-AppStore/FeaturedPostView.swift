//
//  FeaturedPostView.swift
//  SwiftUI-AppStore
//
//  Created by qjinliang on 2020/8/2.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct FeaturedPostView: View {
    
    var captionText: String
    var titleText: String
    var subtitleText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(captionText).font(.caption).foregroundColor(.blue)
            Text(titleText)
            Text(subtitleText).font(.subheadline).foregroundColor(.gray)
            Image("Jay2").resizable().frame(width:(UIApplication.shared.windows.first?.frame.width ?? 0) - 20, height: 250, alignment: .center)
            .cornerRadius(5)
        }.frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
            .padding()
    }
}

struct FeaturedPostView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedPostView(captionText: "New Update", titleText: "The Sims Freeplay", subtitleText: "Bounjour from paris")
    }
}
