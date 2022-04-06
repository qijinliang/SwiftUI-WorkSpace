//
//  TrendingCreatorsView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/2/22.
//

import SwiftUI

struct TrendingCreatorsView: View {
    
    let users: [User] = [
        .init(id: 0,name: "周杰伦", imageName: "sam"),
        .init(id: 1,name: "胡歌", imageName: "billy"),
        .init(id: 2,name: "林依晨", imageName: "amy"),
        .init(id: 3,name: "刘亦菲", imageName: "sam")
    ]
    
    var body: some View {
        VStack() {
            HStack {
                Text("人物打卡")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("查看所有")
                    .font(.system(size: 13, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(users, id: \.self) { user in
                        NavigationLink(
                            destination: UserDetailsView(user: user),
                            label: {
                                DiscoverUserView(user: user)
                            })
                            
                    }
                }.padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}

struct DiscoverUserView: View {
    
    let user: User
    
    var body: some View {
        VStack {
            Image(user.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .cornerRadius(60)
            Text(user.name)
                .font(.system(size: 11, weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.label))
        }
        .frame(width: 60)
            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
    }
    
}
