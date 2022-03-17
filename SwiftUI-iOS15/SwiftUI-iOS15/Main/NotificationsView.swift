//
//  NotificationsView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/17.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                sectionsSection
            }
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(NavigationBar(title: "消息", hasScrolled: .constant(true)))
            .background(Image("Blob 1").offset(x: -180, y: 300))
        }
    }
    
    var sectionsSection: some View {
        VStack(alignment: .leading) {
            ForEach(Array(courseSections.enumerated()), id: \.offset) { index, section in
                if index != 0 { Divider() }
                SectionRow(section: section)
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
