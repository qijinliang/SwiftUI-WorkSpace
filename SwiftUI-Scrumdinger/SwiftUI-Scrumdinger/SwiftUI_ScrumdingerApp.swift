//
//  SwiftUI_ScrumdingerApp.swift
//  SwiftUI-Scrumdinger
//
//  Created by 金亮齐 on 2021/5/15.
//

import SwiftUI

@main
struct SwiftUI_ScrumdingerApp: App {
    @State private var scrums = DailyScrum.data
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
