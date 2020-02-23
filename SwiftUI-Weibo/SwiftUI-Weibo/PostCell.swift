//
//  PostCell.swift
//  SwiftUI-Weibo
//
//  Created by qjinliang on 2020/2/23.
//  Copyright © 2020 qjinliang. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    
    let post: Post
    
    var body: some View {
        HStack(spacing: 5) {
            
            Image(uiImage: UIImage(named: post.avatra)!)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(PostVIPBadge(vip: post.vip)
                    .offset(x: 16, y: 16)
                )
            
            VStack(alignment: .leading, spacing: 5) {
                Text(post.name)
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(red: 242 / 255, green: 99 / 255, blue: 4 / 255))
                    .lineLimit(1)
                Text(post.date)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10)
            
            if !post.isFollowed {
                Spacer()
                
                Button(action: {
                    print("Click follow button")
                    
                }) {
                    Text("关注")
                        .font(.system(size: 14))
                        .foregroundColor(.orange)
                    .frame(width: 50, height: 26)
                    .overlay(
                        RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.orange,lineWidth: 1)
                    )
                }
            }
            
            
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(avatra: "005tnxzUly8gab4i2r73xj30u00u0js8.jpg", vip: true, name: "用户昵称", date: "2020-2-21 00:00", isFollowed: false))
    }
}
