//
//  Home.swift
//  DesignCode
//
//  Created by Meng To on 2019-12-07.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    @State var showContent = false
    @State var animateContent = false
    @State var showSection = false
    @EnvironmentObject var user: UserStore
    
    var body: some View {
        ZStack {
            Color("background2")
                .edgesIgnoringSafeArea(.all)
            
            TabView {
                HomeView(showProfile: $showProfile, showContent: $showContent, showSection: $showSection)
                .scaleEffect(showProfile ? 0.9 : 1)
                .rotation3DEffect(Angle(degrees: showProfile ? -10 + Double(viewState.height/10) : 0), axis: (x: 10.0, y: 0, z: 0))
                .offset(y: showProfile ? -350 : 0)
                .tabItem {
                    Image(systemName: "play.circle.fill")
                    Text("Home")
                }
                CourseList().tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text("Courses")
                }
                UpdateList().tabItem {
                    Image(systemName: "bell")
                    Text("Updates")
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            MenuView()
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    self.showProfile.toggle()
                }
                .offset(y: showProfile ? 0 : UIScreen.main.bounds.height)
                .offset(y: viewState.height)
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                    }
                    .onEnded { value in
                        if self.viewState.height > 50 {
                            self.showProfile = false
                        }
                        self.viewState = .zero
                    }
            )
                .padding(.bottom, 44)
            
//            if showSection {
                CourseDetail(course: courseData[0], show: $showSection, active: .constant(true), activeIndex: .constant(-1))
                    .background(BlurView(style: .systemThickMaterial))
//                    .animation(nil)
                    .animation(.easeOut)
                    .offset(y: showSection ? 0 : screen.height)
                    .edgesIgnoringSafeArea(.all)
//            }
            
            if user.showLogin {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    
                    LoginView()
                    
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .clipShape(Circle())
                        }
                        .padding(16)
                        
                        Spacer()
                    }
                    .onTapGesture {
                        self.user.showLogin = false
                    }
                }
            }
            
            if showContent {
                ZStack {
                    BlurView(style: .systemMaterial)
                        .edgesIgnoringSafeArea(.all)
                    
                    ContentView()
                    
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .clipShape(Circle())
                        }
                        .padding(16)
                        
                        Spacer()
                    }
                    .offset(y: animateContent ? 0 : -100)
                    .onAppear { self.animateContent = true }
                    .onDisappear { self.animateContent = false }
                    .onTapGesture {
                        self.showContent = false
                    }
                }
            }
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(UserStore())
//            .environment(\.colorScheme, .dark)
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    @EnvironmentObject var user: UserStore
    
    var body: some View {
        ZStack {
            if user.isLogged {
                Button(action: { self.showProfile.toggle() }) {
                    Image("Avatar")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                }
            }
            if !user.isLogged {
                Button(action: { self.user.showLogin.toggle() }) {
                    Image(systemName: "person")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color.primary)
                }
                .frame(width: 36, height: 36)
                .background(Color("background3"))
                .clipShape(Circle())
                .shadow(color: Color("primary").opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color("primary").opacity(0.2), radius: 10, x: 0, y: 10)
            }
        }
    }
}
