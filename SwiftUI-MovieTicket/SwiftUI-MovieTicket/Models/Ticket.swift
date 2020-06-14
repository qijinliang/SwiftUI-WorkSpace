//
//  Ticket.swift
//  SwiftUI-MovieTicket
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

struct Ticket: Identifiable {
    var id: UUID = UUID()
    let studioName: String
    let movieTitle: String
    let movieImage: String
    
    static func data() -> [Ticket] {
        return [
            Ticket(studioName: "深圳万象城", movieTitle: "万象城", movieImage: "1"),
            Ticket(studioName: "深圳高新园", movieTitle: "高新园", movieImage: "2"),
            Ticket(studioName: "深圳深大", movieTitle: "深大", movieImage: "3"),
            Ticket(studioName: "深圳科技园", movieTitle: "科技园", movieImage: "4"),
        ]
    }
}
