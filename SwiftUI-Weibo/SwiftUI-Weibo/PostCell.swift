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
        
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 5) {
                post.avatarImage
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
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            Text(post.text)
                .font(.system(size: 17))
            
            if !post.images.isEmpty {
                loadImage(name: post.images[0])
                .resizable()
                .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 30, height: (UIScreen.main.bounds.width - 30) * 0.75)
                .clipped()
            }
            Divider()
            
            HStack(spacing: 0){
                Spacer()
                
                PostCellToolbarButton(image: "message", text: post.commentCountText, color: .black) {
                    print("Click comment 评论")
                }
                
                Spacer()
                
                PostCellToolbarButton(image: "heart", text: post.likeCountText, color: .black) {
                    print("Click comment 点赞")
                }
                
                Spacer()
            }
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postlist.list[0])
    }
}
