//
//  DiscoverCategoriesView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/2/22.
//

import SwiftUI


struct DiscoverCategoriesView: View {
    
    let categories: [Category] = [
        .init(name: "艺术", imageName: "paintpalette.fill"),
        .init(name: "运动", imageName: "sportscourt.fill"),
        .init(name: "现场活动", imageName: "music.mic"),
        .init(name: "美食", imageName: "music.mic"),
        .init(name: "历史记录", imageName: "music.mic"),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment:.top,spacing: 14) {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(destination: CategoryDetailsView(), label: {
                        VStack(spacing: 8) {
                            Image(systemName: category.imageName)
                                .font(.system(size: 20))
                                .foregroundColor(Color(#colorLiteral(red: 0.9882131219, green: 0.6823856831, blue: 0.2509839535, alpha: 1)))
                                .frame(width: 64, height: 64)
                                .background(Color.white)
                                .cornerRadius(64)
                            Text(category.name)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }.frame(width: 68)
                    })
                }
            }  .padding(.horizontal)
        }
    }
}

class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Int]()
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLoading = false
            self.places = [1,2,3,4,5,6,7]
        }
    }
}


//https://travel.letsbuildthatapp.com/travel_discovery/category?name=art

struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    typealias UIViewType = UIActivityIndicatorView
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
         
    }
}

struct CategoryDetailsView: View {
    
    @ObservedObject var vm = CategoryDetailsViewModel()
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack {
                    ActivityIndicatorView()
                    Text("Loading")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color.black)
                .cornerRadius(8)
            } else {
                ScrollView {
                    ForEach(vm.places,id: \.self) { num in
                        VStack(alignment: .leading, spacing: 0) {
                            Image("art1")
                                .resizable()
                                .scaledToFill()
                            Text("Demo123")
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                        }
                        .asTitle()
                        .padding()
                    }
                }
            }
        }
        .navigationBarTitle("Category",displayMode: .inline)
    }
}
