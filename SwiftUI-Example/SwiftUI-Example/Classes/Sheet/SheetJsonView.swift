//
//  SheetJsonView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/7/5.
//

import SwiftUI
import AVKit

struct SheetJsonView: View {
    var body: some View {
        SheetView()
    }
}


struct SheetView: View {
    @State private var popoverIsShown = false
    
    var body: some View {
        Button("显示 Sheet") {
            self.popoverIsShown = true
        }.sheet(isPresented: self.$popoverIsShown) {
            RandomSheet(popoverIsShown: self.$popoverIsShown)
        }
    }
}


struct RandomSheet: View {
    @Binding var popoverIsShown: Bool
    
    var body: some View {
        Button("关闭") {
            self.popoverIsShown = false
        }
    }
}

struct SheetJsonView_Previews: PreviewProvider {
    static var previews: some View {
        SheetJsonView()
    }
}
