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
            
            VStack(){
                Text("点击按钮更改颜色背景")
                    .font(.title)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(#colorLiteral(red: 0.2275036573, green: 0.5323064327, blue: 0.9950136542, alpha: 1.0)))

            Spacer()
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Change ? .red : .blue)
                .padding()
                .animation(.easeInOut)
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
