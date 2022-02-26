//
//  CategoryDetailsView.swift
//  SwiftUI-Discover
//
//  Created by 金亮齐 on 2022/2/26.
//

import SwiftUI
import SDWebImageSwiftUI


class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage = ""
    
    init(name: String) {
        
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: urlString) else {
            self.isLoading = false
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let statusCode = (resp as? HTTPURLResponse)?.statusCode,statusCode >= 400 {
                self.isLoading = false
                self.errorMessage = "Bad status: \(statusCode)"
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                guard let data = data else { return }
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                }catch {
                    print("Failed",error)
                    self.errorMessage = error.localizedDescription
                }
                self.isLoading = false
                
            }
        }.resume()
    }
}


struct CategoryDetailsView: View {
    
    private let name: String
    @ObservedObject private var vm: CategoryDetailsViewModel
    
    init(name: String) {
        self.name = name
        self.vm = .init(name: name)
    }
    
//    @ObservedObject var vm = CategoryDetailsViewModel()
    
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
                ZStack {
                    if !vm.errorMessage.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "xmark.octagon.fill")
                                .font(.system(size: 64, weight: .semibold))
                                .foregroundColor(.red)
                            Text(vm.errorMessage)
                        }
                    }
                    ScrollView {
                        ForEach(vm.places,id: \.self) { place in
                            VStack(alignment: .leading, spacing: 0) {
                                WebImage(url: URL(string: place.thumbnail))
                                    .resizable()
                                    .indicator(.activity)
                                    .transition(.fade(duration: 0.5))
                                    .scaledToFill()
                                Text(place.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding()
                            }
                            .asTitle()
                            .padding()
                        }
                    }
                }
            }
        }
        .navigationBarTitle(name,displayMode: .inline)
    }
}
