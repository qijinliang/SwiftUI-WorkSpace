//
//  ContentView.swift
//  SwiftUI-Calculator
//
//  Created by Jerry on 2019/11/6.
//  Copyright © 2019 QijinLiang. All rights reserved.
//

import SwiftUI

struct CalculatorView: View {
    var body: some View {
        Text("+")
            .font(.title)
            .background(Color.orange)
            .foregroundColor(Color.white)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
