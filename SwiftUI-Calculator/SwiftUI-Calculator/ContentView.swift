//
//  ContentView.swift
//  SwiftUI-Calculator
//
//  Created by Jerry on 2019/11/6.
//  Copyright © 2019 QijinLiang. All rights reserved.
//

import SwiftUI

struct CalculatorButton: Identifiable {
    let id = UUID()
    let title: String
    var color = Color(red: 0.2, green: 0.2, blue: 0.2)
}

struct CalculatorView: View {
    
    let buttons: [CalculatorButton] = [
        .init(title: "1"),
        .init(title: "2"),
        .init(title: "3"),
        .init(title: "+", color: Color.orange)
    ]
    
    let spacing: CGFloat = 12
    
    var body: some View {
        VStack {
            Spacer()
            
            GeometryReader { geometry in
                CalculatorButtonsRow(screenWidth: geometry.size.width, spacing: self.spacing, buttons: self.buttons)
            }
            
            Spacer()
        }.background(Color.black)
    }
}

struct CalculatorButtonsRow: View {
    
    let screenWidth: CGFloat
    let spacing: CGFloat
    let buttons: [CalculatorButton]
    
    var body: some View {
        HStack(spacing: self.spacing) {
           ForEach(self.buttons) {button in
               Text(button.title)
                .font(.system(size: 28))
                .foregroundColor(.white)
                .frame(width: (self.screenWidth - self.spacing * 5) / 4, height: (self.screenWidth - self.spacing * 5) / 4)
                .background(button.color)
                .cornerRadius(100)
               }
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
