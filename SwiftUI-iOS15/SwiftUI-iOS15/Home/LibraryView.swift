//
//  LibraryView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/17.
//

import SwiftUI

struct LibraryView: View {
    @State var contentHasScrolled = false
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            content
                .background(Image("Blob 1").offset(x: 100, y: -60))
        }
    }
    
    var content: some View {
        ScrollView {
            scrollDetection
            
            certificatesSection
                .padding(.top, 100)
            
            Text("历史".uppercased())
                .sectionTitleModifier()
            
            Group {
                cardsSection
                
                menuSection
                    .padding(.bottom, 50)
            }
            .offset(y: -30)
        }
        .coordinateSpace(name: "scroll")
        .overlay(NavigationBar(title: "资料", contentHasScrolled: $contentHasScrolled))
    }
    
    var cardsSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(courses) { item in
                    SmallCourseItem(course: item)
                }
            }
            .padding(20)
            .padding(.bottom, 40)
        }
    }
    
    var menuSection: some View {
        VStack {
            ListRow(title: "历史", icon: "clock.fill")
            Divider()
            ListRow(title: "收藏", icon: "star.fill")
            Divider()
            ListRow(title: "下载", icon: "square.and.arrow.down.fill")
        }
        .padding(20)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 30)
        .padding(.horizontal, 20)
    }
    
    var certificatesSection: some View {
        CertificateView()
            .frame(height: 220)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(.linearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(.horizontal, 20)
                    .offset(y: -20)
            )
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(.linearGradient(colors: [.teal, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(.horizontal, 40)
                    .offset(y: -40)
            )
            .padding(20)
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { offset in
            withAnimation(.easeInOut) {
                if offset < 0 {
                    contentHasScrolled = true
                } else {
                    contentHasScrolled = false
                }
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environmentObject(Model())
    }
}
