//
//  Path2.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/5/27.
//

import SwiftUI

struct Path2: View {
    var body: some View {
        VStack() {
            Path() { path in
                //MARK: 起始点坐标
                path.move(to: CGPoint(x: 20, y: 20))
                //MARK: 多长，y轴不变，x轴自定义
                path.addLine(to: CGPoint(x: 400, y: 20))
                //MARK: 多宽，此时x是400而不是20，X轴不变，y轴自定义
                path.addLine(to: CGPoint(x: 400, y: 300))
                //MARK: 此时x是20，y轴300，x轴和y轴不能自定义
                path.addLine(to: CGPoint(x: 20, y: 300))
                
                path.closeSubpath()
                
            }
            .stroke(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)),lineWidth: 5)
            
            
            Path() { path in
                path.move(to: CGPoint(x: 0, y: width))
                //MARK: 多长，y轴不变，x轴自定义
                path.addLine(to: CGPoint(x: width, y: 0))
                //MARK: 多宽，此时x是400而不是20，X轴不变，y轴自定义
                path.addLine(to: CGPoint(x: 0, y: height))
                //MARK: 此时x是20，y轴300，x轴和y轴不能自定义
                path.addLine(to: CGPoint(x: 20, y: 300))
            }
            .fill((Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))))
        }
    }
}

struct Path2_Previews: PreviewProvider {
    static var previews: some View {
        Path2()
    }
}

