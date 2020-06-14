//
//  BottomTIcketView.swift
//  SwiftUI-MovieTicket
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct BottomTIcketView: View {
    var body: some View {
        Image("barcode")
        .resizable()
            .aspectRatio(contentMode: .fit)
            .fullWidthModifiner(alignment: .center)
        .padding()
        .background(Color("barcode"))
    }
}

struct BottomTIcketView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTIcketView()
    }
}
