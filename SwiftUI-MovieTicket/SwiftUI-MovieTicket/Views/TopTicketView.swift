//
//  TopTicketView.swift
//  SwiftUI-MovieTicket
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct TopTicketView: View {
    
    var studioName: String = "深圳万象城"
    var movieTitle: String = "长颈鹿"
    var movieImage: String = "1"
    var body: some View {
        VStack {
            VStack {
                Text(studioName)
                    .font(.system(size: 16))
                    .foregroundColor(Color.gray)
                    .fullWidthModifiner(alignment: .leading)
                Text(movieTitle)
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundColor(Color.black)
                    .fullWidthModifiner(alignment: .leading)
            }
            .padding(.top, 30)
            .padding(.horizontal)
            Image(movieImage)
                .resizable()
                .frame(height: 200)
                .fullWidthModifiner(alignment: .center)
            
            HStack {
                DetaiInfoView()
                DetaiInfoView(detail1: "排号", detail2: "J", detail3: "日期", detail4: "23/6/2020")
                DetaiInfoView(detail1: "座位", detail2: "34", detail3: "时间", detail4: "19:00")
            }
            .padding(.bottom)
        }
    }
}

struct TopTicketView_Previews: PreviewProvider {
    static var previews: some View {
        TopTicketView()
    }
}
