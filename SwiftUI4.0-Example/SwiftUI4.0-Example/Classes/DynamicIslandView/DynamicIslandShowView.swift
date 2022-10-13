//
//  DynamicIslandShowView.swift
//  SwiftUI4.0-Example
//
//  Created by Cheney on 2022/10/11.
//

import SwiftUI

struct DynamicIslandShowView: View {
    var body: some View {
        Form() {
            Section{
                NavigationLink(destination: DynamicIslandShow2View()){
                    Text("DynamicIslandShow2View")
                }

            }
        }
    }
}

struct DynamicIslandShowView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicIslandShowView()
    }
}
