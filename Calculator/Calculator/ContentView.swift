//
//  ContentView.swift
//  Calculator
//
//  Created by Jerry on 2019/11/5.
//  Copyright © 2019 QijinLiang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("+")
            .background(Color.orange)
            .font(.title)
            .padding()
            .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
