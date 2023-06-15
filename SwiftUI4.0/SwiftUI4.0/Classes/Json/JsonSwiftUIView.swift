//
//  JsonSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/10/01.
//

import SwiftUI


struct Course: Decodable,Identifiable {
    let id, numberOfLessons: Int
    let name, link, imageUrl: String
}

class ContentViewMode: ObservableObject{
    
    @Published var isFetching = false
    @Published var courses = [Course]()
    @Published var errorMessage = ""
    
    @MainActor
    func fetchData() async {
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: urlString) else { return }
        
        do {
            isFetching = true
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let resp = response as? HTTPURLResponse, resp.statusCode >= 300 {
                self.errorMessage = "失败"
            }
            
            self.courses = try JSONDecoder().decode([Course].self, from: data)
            
            isFetching = false
        } catch {
            isFetching = false
            print("加载数据失败:\(error)")
        }
    }
}


struct JsonSwiftUIView: View {
    
    @ObservedObject var vm = ContentViewMode()
    
    var body: some View {
            ScrollView {
                if vm.isFetching {
                    ProgressView()
                }
                VStack {
                    ForEach(vm.courses) { course in
                        let url = URL(string: course.imageUrl)
                        AsyncImage(url: url) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        Text(course.name)
                    }
                }
            }
            .navigationTitle("Courses")
            .task {
                await vm.fetchData()
            }
            .navigationBarItems(trailing: refreshButton)
    }
    
    private var refreshButton: some View {
        Button() {
            Task.init {
                vm.courses.removeAll()
                await vm.fetchData()
            }
        } label: {
            Text("Refresh")
        }
    }
}


struct JsonSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        JsonSwiftUIView()
    }
}
