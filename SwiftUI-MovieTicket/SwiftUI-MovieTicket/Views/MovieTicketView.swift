//
//  ContentView.swift
//  SwiftUI-MovieTicket
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct MovieTicketView: View {
    
    let tickets: [Ticket] = Ticket.data()
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tickets) { ticket in
                        
                        GeometryReader { gr in
                            self.renderTicket(ticket: ticket, angle: gr.frame(in: .global).minX / 10)
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        
                    }
                }
            }
    }
    func renderTicket(ticket: Ticket, angle: CGFloat) -> some View {
        TicketView(ticket: ticket)
            .frame(maxHeight: .infinity)
            .frame(width: UIScreen.main.bounds.width)
            .rotation3DEffect(.degrees(Double(angle)), axis: (x: 0, y: 1, z: 0))
    }
}

struct MovieTicketView_Previews: PreviewProvider {
    static var previews: some View {
        MovieTicketView()
    }
}
