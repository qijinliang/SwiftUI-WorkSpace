//
//  CourseSection.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/17.
//

import SwiftUI

struct CourseSection: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
    var progress: CGFloat
}

var courseSections = [
    CourseSection(title: "SwiftUI学习内容", subtitle: "SwiftUI学习内容", text: "SwiftUI学习内容", image: "Illustration 1", background: "Background 5", logo: "Logo 2", progress: 0.5),
    CourseSection(title: "SwiftUI学习内容", subtitle: "SwiftUI学习内容", text: "SwiftUI学习内容", image: "Illustration 2", background: "Background 4", logo: "Logo 2", progress: 0.2),
    CourseSection(title: "SwiftUI学习内容", subtitle: "SwiftUI学习内容", text: "SwiftUI学习内容", image: "Illustration 3", background: "Background 3", logo: "Logo 3", progress: 0.8),
    CourseSection(title: "SwiftUI学习内容", subtitle: "SwiftUI学习内容", text: "SwiftUI学习内容", image: "Illustration 4", background: "Background 2", logo: "Logo 1", progress: 0.0),
    CourseSection(title: "SwiftUI学习内容", subtitle: "SwiftUI学习内容", text: "SwiftUI学习内容", image: "Illustration 5", background: "Background 1", logo: "Logo 1", progress: 0.1),
    CourseSection(title: "SwiftUI学习内容", subtitle: "SwiftUI学习内容", text: "SwiftUI学习内容", image: "Illustration 1", background: "Background 5", logo: "Logo 2", progress: 0.5),
    CourseSection(title: "SwiftUI学习内容", subtitle: "SwiftUI学习内容", text: "SwiftUI学习内容", image: "Illustration 2", background: "Background 4", logo: "Logo 2", progress: 0.2),
    CourseSection(title: "SwiftUI学习内容", subtitle: "SwiftUI学习内容", text: "SwiftUI学习内容", image: "Illustration 3", background: "Background 3", logo: "Logo 3", progress: 0.8),
    CourseSection(title: "SwiftUI学习内容", subtitle: "SwiftUI学习内容", text: "SwiftUI学习内容", image: "Illustration 4", background: "Background 2", logo: "Logo 1", progress: 0.0),
    CourseSection(title: "SwiftUI学习内容", subtitle: "SwiftUI学习内容", text: "SwiftUI学习内容", image: "Illustration 5", background: "Background 1", logo: "Logo 1", progress: 0.1)
]
