//
//  UserDetailsView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/3/27.
//

import SwiftUI


struct UserDetails: Decodable,Hashable {
    let username, firstName, lastName, profileImage: String
    let followers, following: Int
    let posts: [Post]
}

struct Post: Decodable,Hashable {
    let title, imageUrl, views: String
    let hashtags: [String]
}

class UserDetailsViewModels: ObservableObject {
    
    @Published var userDeatails: UserDetails?
    
    init() {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/user?id=0") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            DispatchQueue.main.async {
                guard let data = data else {
                    return
                }

                do {
                    self.userDeatails = try JSONDecoder().decode(UserDetails.self, from: data)
                } catch let jsonError {
                    print("jsonError",jsonError)
                }
            }
        }.resume()
    }
}


struct UserDetailsView: View {
    
    @ObservedObject var vm = UserDetailsViewModels()
    
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
                
                Text("YouTuber, Vlogger, Trvavel Create")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(.lightGray))
                
                HStack(spacing: 12) {
                    VStack {
                        Text("59,394")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Followers")
                            .font(.system(size: 9, weight: .regular))
                    }
                    Spacer()
                        .frame(width: 0.5, height: 12)
                        .background(Color(.lightGray))
                    
                    VStack {
                        Text("59,394")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Followers")
                            .font(.system(size: 9, weight: .regular))
                    }
                }
                HStack(spacing: 12) {
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("Follow")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color.orange)
                        .cornerRadius(100)
                    })
                    
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("Contact")
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color(white: 0.9))
                        .cornerRadius(100)
                    })
                }
                .font(.system(size: 11, weight: .semibold))
                
                ForEach(vm.userDeatails?.posts ?? [], id: \.self) { post in
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: post.imageUrl)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                        }
                        
                        HStack {
                            Image("amy")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 34)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(post.title)
                                    .font(.system(size: 14, weight: .semibold))
                                Text("500K views")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal, 8)
                        
                        HStack {
                            ForEach(0..<3, id: \.self) { num in
                             Text("Traveling")
                                    .foregroundColor(Color.blue)
                                    .font(.system(size: 14, weight: .semibold))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 4)
                                    .background(Color(white: 0.9))
                                    .cornerRadius(20)
                            }
                        }
                        .padding(.bottom)
                        .padding(.horizontal, 8)
                    }
                    .background(Color(white: 1))
                    .cornerRadius(12)
                    .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
                    
                }
            }.padding(.horizontal)
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
