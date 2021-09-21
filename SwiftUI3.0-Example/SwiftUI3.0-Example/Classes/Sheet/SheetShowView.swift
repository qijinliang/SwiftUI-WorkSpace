//
//  SheetShowView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/7/14.
//

import SwiftUI

struct SheetShowView: View {
    var body: some View {
        Form() {
            Section(header: Text("Sheet").font(.title3).fontWeight(.heavy)) {
                NavigationLink(destination: SheetJsonView()) {
                    Text("Sheet")
                }
            }
        }
    }
}

struct SheetShowView_Previews: PreviewProvider {
    static var previews: some View {
        SheetShowView()
    }
}
