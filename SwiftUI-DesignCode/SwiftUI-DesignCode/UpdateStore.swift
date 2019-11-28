//
//  UpdateStore.swift
//  SwiftUI-DesignCode
//
//  Created by Jerry on 2019/11/28.
//  Copyright © 2019 QijinLiang. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    var willChange = PassthroughSubject<Void, Never>()
    
    var updates: [Update] {
        didSet {
            willChange.send()
        }
    }
    
    init(updates: [Update] = []) {
        self.updates = updates
    }
}
