//
//  Course.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/7.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
}

var featuredCourses = [
    Course(title: "SwiftUI学习中心", subtitle: "20 课时 - 3 小时", text: "使用SwiftUI如何编译，动画，手势等", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    Course(title: "如何设计UI iOS15", subtitle: "20 课时 - 3 小时", text: "布局iOS15，制作UI", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    Course(title: "Flutter 学习中心", subtitle: "20 课时 - 3 小时", text: "使用Fultter跨平台开发", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
    Course(title: "阅读", subtitle: "20 课时 - 3 小时", text: "阅读更多的书籍，帮助你快速入门", image: "Illustration 2", background: "Background 2", logo: "Logo 3"),
]

var courses = [
    Course(title: "SwiftUI学习中心", subtitle: "20 课时 - 3 小时", text: "使用SwiftUI如何编译，动画，手势等", image: "Illustration 4", background: "Background 4", logo: "Logo 2"),
    Course(title: "如何设计UI iOS15", subtitle: "20 课时 - 3 小时", text: "布局iOS15，制作UI", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    Course(title: "Flutter 学习中心", subtitle: "20 课时 - 3 小时", text: "使用Fultter跨平台开发", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
    Course(title: "阅读", subtitle: "20 课时 - 3 小时", text: "阅读更多的书籍，帮助你快速入门", image: "Illustration 2", background: "Background 2", logo: "Logo 3"),
]

