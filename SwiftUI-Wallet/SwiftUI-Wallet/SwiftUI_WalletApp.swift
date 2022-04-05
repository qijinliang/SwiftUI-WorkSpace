//
//  SwiftUI_WalletApp.swift
//  SwiftUI-Wallet
//
//  Created by 金亮齐 on 2022/4/4.
//

import SwiftUI

@main
struct SwiftUI_WalletApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
