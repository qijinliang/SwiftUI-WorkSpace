//
//  SearchView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/13.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @State var showCourse = false
    @State var selectedCourse = courses[0]
    @Namespace var namespace
    
    var body: some View {
        NavigationView {
            VStack {
                content
                Spacer()
            }
        }
        .searchable(text: $text) {
            ForEach(suggestions) { suggestion in
                Button {
                    text = suggestion.text
                } label: {
                    Text(suggestion.text)
                }
                .searchCompletion(suggestion.text)
            }
        }
    }
    
    var content: some View {
        VStack {
            ForEach(Array(results.enumerated()), id: \.offset) { index, course in
                if index != 0 { Divider() }
                Button {
                    showCourse = true
                    selectedCourse = course
                } label:  {
                    ListRow(title: course.title, icon: "magnifyingglass")
                }
                .buttonStyle(.plain)
            }
            
            if results.isEmpty {
                Text("没有任何结果")
            }
        }
        .padding(20)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 30)
        .padding(20)
        .navigationTitle("搜索")
        .background(
            Rectangle()
                .fill(.regularMaterial)
                .frame(height: 200)
                .frame(maxHeight: .infinity, alignment: .top)
                .offset(y: -200)
                .blur(radius: 20)
        )
        .background(
            Image("Blob 1").offset(x: -100, y: -200)
                .accessibility(hidden: true)
        )
        .sheet(isPresented: $showCourse) {
            CourseView(namespace: namespace, course: $selectedCourse, isAnimated: false)
        }
    }
    
    var results: [Course] {
        if text.isEmpty {
            return courses
        } else {
            return courses.filter { $0.title.contains(text) }
        }
    }
    
    var suggestions: [Suggestion] {
        if text.isEmpty {
            return suggestionsData
        } else {
            return suggestionsData.filter { $0.text.contains(text) }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
    
struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
}

var suggestionsData = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "Flutter"),
    Suggestion(text: "Design"),
    Suggestion(text: "React")
]
