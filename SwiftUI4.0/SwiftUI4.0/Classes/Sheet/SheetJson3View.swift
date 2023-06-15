//
//  SheetJson3View.swift
//  SwiftUI4.0
//
//  Created by 金亮 on 2023/6/15.
//

import SwiftUI

struct SheetJson3View: View {
    @State var showSheet = false

    var body: some View {
        Button("Show Sheet") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            SheetShowView()
                .presentationDetents([.height(400), .medium, .large])
                .presentationDragIndicator(.automatic)
        }
    }
}

struct SheetJson3View_Previews: PreviewProvider {
    static var previews: some View {
        SheetJson3View()
    }
}
