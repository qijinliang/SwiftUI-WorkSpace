//
//  CourseList.swift
//  DesignCode
//
//  Created by Meng To on 2019-12-10.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseList: View {
//    @State var courses = courseData
    @ObservedObject var store = CourseStore()
    @State var active = false
    @State var activeIndex = -1
    @State var activeView = CGSize.zero
    
    var body: some View {
        ZStack {
            Color.black.opacity(Double(self.activeView.height/500))
                .edgesIgnoringSafeArea(.all)
                .statusBar(hidden: active ? true : false)
                .animation(.linear)
            
            ScrollView {
                VStack(spacing: 30) {
                    Text("Courses")
                        .font(.system(.largeTitle))
                        .fontWeight(.bold)
                        .alignmentGuide(.leading, computeValue: { _ in -30})
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                        .animation(nil)
                    
                    ForEach(store.courses.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            ZStack {
                                CourseView(
                                    show: self.$store.courses[index].show,
                                    course: self.store.courses[index],
                                    active: self.$active,
                                    index: index,
                                    activeIndex: self.$activeIndex,
                                    activeView: self.$activeView
                                )
                                .offset(y: self.store.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                                .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                .rotationEffect(Angle(degrees: Double(self.activeView.height / -10)))
                                .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                            }
                        }
                        .frame(height: getCardHeight())
                        .frame(maxWidth: self.active ? 712 : getCardWidth())
                    }
                }
                .frame(width: screen.width)
                .padding(.bottom, 300)
                .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0))
            }
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: URL
    var logo: UIImage
    var color: UIColor
    var show: Bool
}

var courseData = [
    Course(title: "Prototype Designs in SwiftUI", subtitle: "18 Sections", text: "SwiftUI is hands-down the best way for designers to take a first step into code.  Thanks to its live Preview, you can iterate quickly and create powerful user interfaces with a few lines of code that works for all of Apple's platforms. Take your static design to the next level and build real apps with the simplicity of a prototyping tool.", image: URL(string: "https://dl.dropbox.com/s/pmggyp7j64nvvg8/Certificate%402x.png?dl=0")!, logo: #imageLiteral(resourceName: "Logo"), color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), show: false),
    Course(title: "SwiftUI Advanced", subtitle: "20 Sections", text: "SwiftUI makes it super easy to animate and add gestures to your app. The code is lightweight and easy to understand, even for newcomers who come from React or Flutter.", image: URL(string: "https://dl.dropbox.com/s/i08umta02pa09ns/Card3%402x.png?dl=0")!, logo: #imageLiteral(resourceName: "Logo"), color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), show: false),
    Course(title: "UI Design for Developers", subtitle: "20 Sections", text: "We're using Sketch to design the interface and Shape for the illustrations. All design and source files are provided so that you can upgrade your UI skills while following the lessons.", image: URL(string: "https://dl.dropbox.com/s/6z67xs71hbyy6ds/Card4%402x.png?dl=0")!, logo: #imageLiteral(resourceName: "Logo"), color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), show: false)
]

struct CourseView: View {
    @Binding var show: Bool
    var course: Course
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
    @Binding var activeView: CGSize
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading,spacing: 30) {
                Text(course.text)
                
                Text("About this course")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                    .foregroundColor(Color("secondary"))
                
                Text("Minimal coding experience required, such as in HTML and CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
                .foregroundColor(Color("secondary"))
            }
            .padding(30)
            .offset(y: show ? 460 : 0)
            .frame(maxWidth: show ? .infinity : getCardWidth())
            .frame(maxHeight: show ? screen.height : 280, alignment: .top)
            .background(Color("background3"))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(course.title)
                            .font(.system(size: 24, weight: .bold))
                            .lineLimit(3)
                            .foregroundColor(.white)
                            .animation(nil)
                        Text(course.subtitle.uppercased())
                            .foregroundColor(Color.white.opacity(0.7))
                            .animation(nil)
                    }
                    Spacer()
                    ZStack {
                        Image(uiImage: course.logo)
                            .opacity(show ? 0 : 1)
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                }
                Spacer()
                WebImage(url: course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 414)
                    .frame(height: 140, alignment: .top)
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
            .frame(height: show ? 460 : 280)
            .frame(maxWidth: show ? .infinity : getCardWidth())
            .background(Color(course.color))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
            .gesture(
                show ?
                    DragGesture()
                        .onChanged { value in
//                            guard !self.show else { return }
                            
                            guard value.translation.height > 0 else { return }
                            guard value.translation.height < 300 else { return }
                            
                            self.activeView = value.translation
                    }
                    .onEnded { value in
                        if self.activeView.height > 50 {
                            self.show = false
                            self.active = false
                            self.activeIndex = -1
                        }
                        self.activeView = .zero
                    }
                    : nil
            )
            .onTapGesture {
                self.show.toggle()
                self.active.toggle()
                
                if self.show {
                    self.activeIndex = self.index
                } else {
                    self.activeIndex = -1
                }
            }
            
//            Text("\(self.activeView.height)").offset(y: 100)
            
//            if show {
//                CourseDetail(course: course, show: $show, active: $active, activeIndex: $activeIndex)
//                    .background(Color("background1"))
//                    .animation(.linear(duration: 0))
//            }
        }
        .gesture(
            show ?
                DragGesture()
                    .onChanged { value in
                        guard value.translation.height > 0 else { return }
                        guard value.translation.height < 300 else { return }
                        
                        self.activeView = value.translation
                }
                .onEnded { value in
                    if self.activeView.height > 50 {
                        self.show = false
                        self.active = false
                        self.activeIndex = -1
                    }
                    self.activeView = .zero
                }
                : nil
        )
        .frame(height: show ? screen.height : 280)
        .edgesIgnoringSafeArea(.all)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .scaleEffect(1 - self.activeView.height / 1000)
        .rotation3DEffect(Angle(degrees: Double(self.activeView.height / -10)), axis: (x: 10, y: 0, z: 0))
        .hueRotation(Angle(degrees: Double(self.activeView.height)))
    }
}
