//
//  CourseItem.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/8.
//

import SwiftUI

struct CourseItem: View {
    var namespace: Namespace.ID
    var course: Course
    
    @EnvironmentObject var model: Model
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        VStack {
            LogoView(image: course.logo)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(20)
                .matchedGeometryEffect(id: "logo\(course.index)", in: namespace)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(course.title)
                    .font(.title).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .matchedGeometryEffect(id: "title\(course.index)", in: namespace)
                    .foregroundColor(.white)
                
                Text("Developer开发中心".uppercased())
                    .font(.footnote).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .matchedGeometryEffect(id: "subtitle\(course.index)", in: namespace)
                    .foregroundColor(.white.opacity(0.7))
                
                Text("借助 SwiftUI，您可以利用 Swift 的强大功能打造适合各个 Apple 平台的精美 app，而无需编写大量代码。SwiftUI 让您只需使用一套工具和 API，就能在任何 Apple 设备上为所有用户带来更加出色的体验。")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white.opacity(0.7))
                    .matchedGeometryEffect(id: "description\(course.index)", in: namespace)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .cornerRadius(30)
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur\(course.index)", in: namespace)
            )
        }
        .background(
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .matchedGeometryEffect(id: "image\(course.index)", in: namespace)
                .offset(y: -30)
        )
        .background(
            Image(course.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .disabled(true)
                .matchedGeometryEffect(id: "background\(course.index)", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30)
                .matchedGeometryEffect(id: "mask\(course.index)", in: namespace)
        )
        .overlay(
            Image(horizontalSizeClass == .compact ? "Waves 1" : "Waves 2")
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: 0)
                .opacity(0)
                .matchedGeometryEffect(id: "waves\(course.index)", in: namespace)
        )
        .frame(height: 300)
        .onTapGesture {
            withAnimation(.openCard) {
                model.showDetail = true
                model.selectedCourse = course.index
            }
        }
    }
}

struct CardItem_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseItem(namespace: namespace, course: courses[0])
            .environmentObject(Model())
    }
}
