//
//  SheetShowView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/7/14.
//

import SwiftUI

struct SheetShowView: View {
    var body: some View {
        Form() {
            Section(header: Text("弹出").font(.title3).fontWeight(.heavy)) {
                NavigationLink(destination: SheetJsonView()) {
                    Text("弹出视图")
                }
            }
            
            Section(header: Text("弹出2").font(.title3).fontWeight(.heavy)) {
                NavigationLink(destination: SheetJson2View()) {
                    Text("弹出视图2")
                }
            }
            Section(header: Text("弹出3").font(.title3).fontWeight(.heavy)) {
                NavigationLink(destination: SheetJson3View()) {
                    Text("弹出视图3")
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
