//
//  middleView.swift
//  SwiftUI-AppStore
//
//  Created by qjinliang on 2020/6/24.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct middleView: View {
    @State var show = false
    var toplist = ["s2","s3","s3"]
    var body: some View {
        VStack(spacing: 15) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(toplist, id: \.self) { i in
                        Image(i).renderingMode(.original).onTapGesture {
                            self.show.toggle()
                        }
                    }
                }
            }.padding(.vertical, 15)

            HStack(spacing: 15) {

                Button(action: {

                }) {
                    Image("trophy").renderingMode(.original)
                }

                Button(action: {

                }) {
                    Image("cards").renderingMode(.original)
                }

                Button(action: {

                }) {
                    Image("puzzle").renderingMode(.original)
                }

                Button(action: {

                }) {
                    Image("punch").renderingMode(.original)
                }
            }
        }.sheet(isPresented: self.$show) {
            ExpandView(show: self.$show)
        }
    }
}

struct middleView_Previews: PreviewProvider {
    static var previews: some View {
        middleView()
    }
}
