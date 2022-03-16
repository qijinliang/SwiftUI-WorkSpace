//
//  Model.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/12.
//

import SwiftUI
import Combine

class Model: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var selectedModal: Modal = .signIn
}

enum Modal: String {
    case signUp
    case signIn
}
