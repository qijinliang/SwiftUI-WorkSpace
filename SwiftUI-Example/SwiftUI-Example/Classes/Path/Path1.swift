//
//  Path1.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/5/26.
//

import SwiftUI

let width = UIScreen.main.bounds.size.width
let height = UIScreen.main.bounds.size.height

struct Path1: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 10, y: 10))
                path.addLine(to: CGPoint(x: width - 10, y: 10))
                path.addLine(to: CGPoint(x: width - 10, y: height - 10))
                path.addLine(to: CGPoint(x: 10, y: height - 10 ))
            }
            .fill(Color(#colorLiteral(red: 0.4685096145, green: 0.8186606765, blue: 0.9855954051, alpha: 1)))
            
            Path { path in
                path.move(to: CGPoint(x: 30, y: 30))
                path.addLine(to: CGPoint(x: width - 30, y: 30))
                path.addLine(to: CGPoint(x: width - 30, y: height - 30))
                path.addLine(to: CGPoint(x: 30, y: height - 30 ))
            }
            .fill(Color(#colorLiteral(red: 0.3133516014, green: 0.1172527149, blue: 0.5996462107, alpha: 1)))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Path1_Previews: PreviewProvider {
    static var previews: some View {
        Path1()
    }
}
