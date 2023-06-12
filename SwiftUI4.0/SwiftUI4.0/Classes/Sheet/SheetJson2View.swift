//
//  SheetJson2View.swift
//  SwiftUI4.0
//
//  Created by jinliang on 2023/6/1.
//

import SwiftUI

struct SheetJson2View: View {
    
    @State private var showheet = false
    
    var body: some View {
        ZStack{
            Button("show Buttom sheet") {
                showheet.toggle()
            }
            .tint(.black)
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $showheet) {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .presentationDetents([.medium,.large])
            }
        }
        Spacer()
    }
}

struct SheetJson2View_Previews: PreviewProvider {
    static var previews: some View {
        SheetJson2View()
    }
}
