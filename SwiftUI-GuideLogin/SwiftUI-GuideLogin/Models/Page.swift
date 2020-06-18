//
//  Page.swift
//  SwiftUI-GuideLogin
//
//  Created by qjinliang on 2020/6/18.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

struct Page: Identifiable {
    
    let id: UUID
    let image: String
    let heading: String
    let subSubheading: String
    
    static var getAll: [Page] {
        [
            Page(id: UUID(), image: "screen-1", heading: "SwiftUI引导页一", subSubheading: "使用SwiftUI仿写引导页，喜欢SwiftUI可以点个赞."),
            Page(id: UUID(), image: "screen-2", heading: "SwiftUI引导页二", subSubheading: "使用SwiftUI仿写引导页，更多是实例还在编写中."),
            Page(id: UUID(), image: "screen-3", heading: "SwiftUI引导页三", subSubheading: "使用SwiftUI仿写引导页，让更多开发者一起学习."),
            Page(id: UUID(), image: "screen-4", heading: "SwiftUI引导页四", subSubheading: "使用SwiftUI仿写引导页，谢谢~")
            
        ]
    }
}
