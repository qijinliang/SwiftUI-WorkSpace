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
    let imageName: String
    
    static func data() -> [Ticket] {
        return [
             Ticket(studioName: "‎Walt Disney Pictures", movieTitle: "ALADDIN", imageName: "aladdin.jpg"),
             Ticket(studioName: "‎Walt Disney Pictures", movieTitle: "CARS", imageName: "cars.jpg"),
             Ticket(studioName: "‎‎Seven Bucks Productions‎", movieTitle: "HOBBS AND SHAW", imageName: "hobbsandshaw.jpg"),
             Ticket(studioName: "‎Lin Pictures", movieTitle: "IT", imageName: "it.jpg"),
             Ticket(studioName: "‎Warner Bros. Pictures", movieTitle: "JOKER", imageName: "joker.jpg"),
             Ticket(studioName: "‎Walt Disney Pictures", movieTitle: "LION KING", imageName: "lionking.jpg"),
             Ticket(studioName: "‎Paramount Pictures", movieTitle: "TERMINATOR", imageName: "terminator.jpg"),
             Ticket(studioName: "‎Marvel Studios", movieTitle: "X-MEN", imageName: "xmen.jpg"),
        ]
    }
}
