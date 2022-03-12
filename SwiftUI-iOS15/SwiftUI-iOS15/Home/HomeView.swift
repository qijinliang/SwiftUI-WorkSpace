//
//  HomeView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/7.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = false
    @State var selectedID = UUID()
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                
                featured
                
                Text("个人中心".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                if !show {
                    cards
                }else{
                    ForEach(courses) { course in
                        Rectangle()
                            .fill(.white)
                            .frame(height: 300)
                            .cornerRadius(30)
                            .shadow(color: Color("shadow"), radius: 20, x: 0, y: 10)
                            .opacity(0.3)
                            .padding(.horizontal, 30)
                    }
                }
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "首页", hasScrolled: $hasScrolled)
            )
            if show {
                detail
            }
        }
        
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = false
                }else{
                    showStatusBar = true
                }
            }
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
    }
    
    var featured: some View {
        TabView {
            ForEach(featuredcourses) { course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    
                    FeaturedItem(course: course)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 40))
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32, y: -80)
                                .offset(x: minX / 2)
                        )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
    }
    
    var cards: some View {
        ForEach(courses) { course in
            CourseItem(namespace: namespace, show: $show, course:course)
                .onTapGesture {
                    withAnimation(.openCard) {
                        show.toggle()
                        model.showDetail.toggle()
                        showStatusBar = false
                        selectedID = course.id
                    }
            }
        }
    }
    
    var detail: some View {
        ForEach(courses) { course in
            if course.id == selectedID {
                CourseView(namespace: namespace,course:course, show: $show)
                    .zIndex(1)
                    .transition(.asymmetric(insertion: .opacity.animation(.easeInOut(duration: 0.1)), removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().colorScheme(.dark)
    }
}

