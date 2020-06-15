//
//  TicketView.swift
//  SwiftUI-MovieTicket
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct TicketView: View {
    var ticket = Ticket.data().first!
    var body: some View {
        VStack(spacing: 0) {
            TopTicketView(studioName: ticket.studioName, movieTitle: ticket.movieTitle, imageName: ticket.imageName)
                .background(Color.white)
                .clipShape(TicketShape())
                .modifier(CardStyleModifier())
            
            
            DashedSeperator()
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 1,dash: [4,8], dashPhase: 4))
                .frame(height: 0.4)
                .padding(.horizontal)
            
            BottomTicketView()
            .background(Color("barcodeBG"))
                .clipShape(TicketShape().rotation(Angle(degrees: 180)))
                .modifier(CardStyleModifier())
        }
        .padding()
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
