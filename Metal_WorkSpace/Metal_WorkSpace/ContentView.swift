//
//  ContentView.swift
//  Metal_WorkSpace
//
//  Created by Cheney on 2023/8/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MetalView().border(Color.black, width: 2)
            Text("Hello, world!")
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
