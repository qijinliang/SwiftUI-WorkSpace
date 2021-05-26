//
//  Path1.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/5/26.
//

import SwiftUI

struct Path1: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 20, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 200, y: 300))
            path.addLine(to: CGPoint(x: 20, y: 10 ))
        }
        .fill(Color.green)
    }
}

struct Path1_Previews: PreviewProvider {
    static var previews: some View {
        Path1()
    }
}
