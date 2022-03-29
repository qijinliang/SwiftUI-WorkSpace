//
//  UserDetailsView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/3/27.
//

import SwiftUI

struct UserDetailsView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Image(user.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    .padding(.top)
                
                Text("Amy Adams")
                    .font(.system(size: 14, weight: .semibold))
                
                HStack {
                    Text("@amyadams20")
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 10, weight: .semibold))
                    Text("1233")
                }
                .font(.system(size: 12, weight: .regular))
            }
        }
        .navigationBarTitle(user.name, displayMode: .inline)
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailsView(user: .init(name: "用户名", imageName: "amy"))
        }
    }
}
