//
//  SheetMainView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/7/14.
//

import SwiftUI

struct SheetMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: SheetShowView()) {
                Text("Sheet")
            }
        }
    }
}

struct SheetMainView_Previews: PreviewProvider {
    static var previews: some View {
        SheetMainView()
    }
}
