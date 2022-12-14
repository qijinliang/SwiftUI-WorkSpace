//
//  Path1.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/5/26.
//

import SwiftUI

struct Path1: View {
    var body: some View {
        ZStack {
            Path() { path in
                path.move(to: CGPoint(x: 20, y: 20))
                path.addLine(to: CGPoint(x: width - 20, y: 20))
                path.addLine(to: CGPoint(x: width - 20, y: height - 20))
                path.addLine(to: CGPoint(x: 20, y: height - 20 ))
            }
            .fill(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
            
            Path() { path in
                path.move(to: CGPoint(x: 40, y: 40))
                path.addLine(to: CGPoint(x: width - 40, y: 40))
                path.addLine(to: CGPoint(x: width - 40, y: height - 40))
                path.addLine(to: CGPoint(x: 40, y: height - 40 ))
            }
            .fill(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
            
            Path() { path in
                path.move(to: CGPoint(x: 60, y: 60))
                path.addLine(to: CGPoint(x: width - 60, y: 60))
                path.addLine(to: CGPoint(x: width - 60, y: height - 60))
                path.addLine(to: CGPoint(x: 60, y: height - 60 ))
            }
            .fill(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
            
            Path() { path in
                path.move(to: CGPoint(x: 80, y: 80))
                path.addLine(to: CGPoint(x: width - 80, y: 80))
                path.addLine(to: CGPoint(x: width - 80, y: height - 80))
                path.addLine(to: CGPoint(x: 80, y: height - 80 ))
            }
            .fill(Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)))
            
            Path() { path in
                path.move(to: CGPoint(x: 100, y: 100))
                path.addLine(to: CGPoint(x: width - 100, y: 100))
                path.addLine(to: CGPoint(x: width - 100, y: height - 100))
                path.addLine(to: CGPoint(x: 100, y: height - 100 ))
            }
            .fill(Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
        }
        .background(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Path1_Previews: PreviewProvider {
    static var previews: some View {
        Path1()
    }
}
