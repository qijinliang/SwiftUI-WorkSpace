//
//  TicketView.swift
//  SwiftUI-MovieTicket
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct TicketView: View {
    var ticket = Ticket.data()[2]
    var body: some View {
        VStack(spacing: 0) {
            TopTicketView(studioName: ticket.studioName, movieTitle: ticket.movieTitle, movieImage: ticket.movieImage)
                .background(Color.white)
                .clipShape(TicketShape())
                .cardStyleModifiner()
            DashedLine().stroke(Color.gray, style: StrokeStyle(lineWidth: 1,dash: [4,8], dashPhase: 4))
                .frame(height: 1)
                .padding(.horizontal)
            BottomTIcketView()
                .clipShape(TicketShape().rotation(.degrees(180)))
                .cardStyleModifiner()
        }
        .padding()
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
