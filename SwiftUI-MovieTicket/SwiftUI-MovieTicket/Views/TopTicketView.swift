//
//  TopTicketView.swift
//  SwiftUI-MovieTicket
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct TopTicketView: View {
    
    var studioName: String = "studio"
    var movieTitle: String = "ONLY GOD FORGIVES"
    var imageName: String = "terminator.jpg"
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(studioName)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.gray)
                Text(movieTitle)
                    .font(.system(size: 30, weight: .black))
            }.frame(minWidth: 0.0, maxWidth: .infinity,alignment: .leading)
            .padding(.top, 30)
            .padding(.horizontal)
            
            Image(uiImage: UIImage(named: imageName)!)
                .resizable().modifier(FullWidthModifiner())
                .frame(height: 200)
                .scaledToFit()
            
            HStack {
                DetaiInfoView(detail1: "SCREEN", detail2: "18", detail3: "PRICE", detail4: "$5.68")
                DetaiInfoView(detail1: "ROW", detail2: "H", detail3: "DATE", detail4: "23/05/13")
                DetaiInfoView()
            }
            .padding(.vertical)
        }
    }
}

struct TopTicketView_Previews: PreviewProvider {
    static var previews: some View {
        TopTicketView()
    }
}
