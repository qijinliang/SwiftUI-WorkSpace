//
//  BottomTIcketView.swift
//  SwiftUI-MovieTicket
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct BottomTicketView: View {
    var body: some View {
        Image("Barcode")
        .resizable()
        .scaledToFit()
        .padding(30)
        .modifier(FullWidthModifiner())
    }
}

struct BottomTicketView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTicketView()
    }
}
