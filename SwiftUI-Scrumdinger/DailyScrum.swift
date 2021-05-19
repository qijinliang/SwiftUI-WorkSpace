//
//  DailyScrum.swift
//  SwiftUI-Scrumdinger
//
//  Created by Cheney on 2021/5/18.
//

import SwiftUI

struct DailyScrum: Identifiable{
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
    var textColor: Color
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, color: Color, textColor: Color) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.color = color
        self.textColor = textColor
    }
}

extension DailyScrum {
    static var data: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, color: Color(#colorLiteral(red: 1, green: 0.8728231788, blue: 0.2557321191, alpha: 1)), textColor: Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))),
            DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, color: Color(#colorLiteral(red: 1, green: 0.5476035476, blue: 0.2549909353, alpha: 1)), textColor: Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))),
            DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 1, color: Color(#colorLiteral(red: 0.9988076091, green: 0.3693974614, blue: 0.3691136241, alpha: 1)), textColor: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
        ]
    }
}

extension DailyScrum {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5.0
        var color: Color = Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
    }

    var data: Data {
        return Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), color: color)
    }
}
