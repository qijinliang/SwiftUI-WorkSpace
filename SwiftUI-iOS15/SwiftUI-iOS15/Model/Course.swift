//
//  Course.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/7.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var index: Int
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
}

var courses = [
    Course(index: 1, title: "学习SwiftUI", subtitle: "2学习SwiftUI", text: "学习SwiftUI", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    Course(index: 2, title: "学习SwiftUI", subtitle: "学习SwiftUI", text: "学习SwiftUI", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    Course(index: 3, title: "学习SwiftUI", subtitle: "学习SwiftUI", text: "学习SwiftUI", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
    Course(index: 4, title: "学习SwiftUI", subtitle: "学习SwiftUI", text: "学习SwiftUI", image: "Illustration 2", background: "Background 2", logo: "Logo 3"),
]

var featuredCourses = [
    Course(index: 1, title: "学习SwiftUI", subtitle: "学习SwiftUI", text: "学习SwiftUI", image: "Illustration 9", background: "Background 5", logo: "Logo 2"),
    Course(index: 2, title: "学习SwiftUI", subtitle: "学习SwiftUI", text: "学习SwiftUI", image: "Illustration 2", background: "Background 3", logo: "Logo 3"),
    Course(index: 3, title: "学习SwiftUI", subtitle: "学习SwiftUI", text: "学习SwiftUI", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    Course(index: 4, title: "学习SwiftUI", subtitle: "学习SwiftUI", text: "学习SwiftUI", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
]
