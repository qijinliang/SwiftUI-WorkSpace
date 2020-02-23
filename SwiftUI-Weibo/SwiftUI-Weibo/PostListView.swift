//
//  PostListView.swift
//  SwiftUI-Weibo
//
//  Created by qjinliang on 2020/2/23.
//  Copyright © 2020 qjinliang. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        List {
            ForEach(postlist.list) { post in
                PostCell(post: post)
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
