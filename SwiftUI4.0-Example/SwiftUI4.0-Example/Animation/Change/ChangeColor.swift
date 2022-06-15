//
//  ChangeColor.swift
//  SwiftUI2.0-Example
//
//  Created by Cheney on 2021/9/6.
//

import SwiftUI

struct ChangeColor: View {
    @State private var Change =  false
    var body: some View {
        VStack() {
            Text("颜色的更变")
                .font(.title)
                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Change ? .red : .blue)
                .padding()
                .animation(.easeInOut, value: Change)
                .frame(maxWidth: .infinity, maxHeight: 300)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Change ? .red : .blue)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 300)
            
            
            Button("点击") {
                self.Change.toggle()
            }
        }
    }
}

struct ChangeColor_Previews: PreviewProvider {
    static var previews: some View {
        ChangeColor()
    }
}
