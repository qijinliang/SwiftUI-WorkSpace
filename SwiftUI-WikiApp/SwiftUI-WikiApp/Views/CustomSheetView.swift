//
//  CustomSheetView.swift
//  SwiftUI-WikiApp
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct CustomSheetView: View {
    @Binding  var currentHeight: CGFloat
    @Binding var movingOffset: CGFloat
    
    var body: some View {
        SheetView(currentHeight: self.$currentHeight, movingOffset: self.$movingOffset, smallHeight: 300, onDragEnded: { position in
        
        }) {
            ZStack(alignment: .top) {
                CreateNewWikiView(movingOffset: self.$currentHeight)
                ToolBarView(currentHeight: self.$currentHeight, movingOffset: self.$movingOffset)
            }.background(Color.white).clipShape(RoundedShape())
            .shadow(color: Color.gray.opacity(0.2), radius: 6, x: 0.0, y: -5)
        }
    }
}

struct CustomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSheetView(currentHeight: .constant(0.0), movingOffset: .constant(0.0))
    }
}
