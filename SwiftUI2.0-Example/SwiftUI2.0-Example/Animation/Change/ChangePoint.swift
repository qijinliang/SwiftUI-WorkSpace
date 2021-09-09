//
//  ChangePoint.swift
//  SwiftUI2.0-Example
//
//  Created by Cheney on 2021/9/8.
//

import SwiftUI

struct ChangePoint: View {
    @State private var Change = false
    var body: some View {
        VStack(spacing: 30) {
            Text("点击移动正方形位置")
                .padding()
                .font(.system(size: 30, weight: .heavy))
            
            RoundedRectangle(cornerRadius: 10)
                .padding()
                .frame(width: 200, height: 200)
                //MARK: 这样做也是可以移动，采取的是position方式
                .position(self.Change ? CGPoint(x: 100, y: 100) : CGPoint(x: 300, y: 300))
                .foregroundColor(self.Change ? Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)) : Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                .animation(.easeInOut)
            
            Button(action: {
                self.Change.toggle()
            }) {
                
                Text("点击")
                    .fontWeight(.semibold)
                    .font(.title3)
                
            }
            .padding()
            .foregroundColor(.white)
            .background(self.Change ? Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)) : Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
            .animation(.easeInOut)
            .cornerRadius(20)
        }
    }
}

struct ChangePoint_Previews: PreviewProvider {
    static var previews: some View {
        ChangePoint()
    }
}
