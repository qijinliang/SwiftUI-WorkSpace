//
//  BingdingMainView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/7/14.
//

import SwiftUI

struct BingdingMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: BingdingShowView()) {
                Text("Bingding")
            }
        }
    }
}

struct BingdingMainView_Previews: PreviewProvider {
    static var previews: some View {
        BingdingMainView()
    }
}
