//
//  DetaiInfoView.swift
//  SwiftUI-MovieTicket
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct DetaiInfoView: View {
    
    var detail1 = "SEST"
    var detail2 = "34"
    var detail3 = "TIME"
    var detail4 = "18:15"
    
    var body: some View {
        VStack(spacing: 10) {
            VStack {
                Text(detail1)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(Color.gray)
                Text(detail2)
                    .font(.system(size: 30, weight: .black))
            }
            VStack {
                Text(detail3)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(Color.gray)
                Text(detail4).font(.system(size: 15, weight: .bold))
            }
        }.modifier(FullWidthModifiner())
    }
}

struct DetaiInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DetaiInfoView()
    }
}
