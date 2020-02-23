//
//  UserStore.swift
//  DesignCode
//
//  Created by Meng To on 2019-12-13.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
    @Published var isLogged = false
    @Published var showLogin = false
}
