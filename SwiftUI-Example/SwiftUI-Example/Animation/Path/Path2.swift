//
//  Path2.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/5/27.
//

import SwiftUI

struct Path2: View {
    var body: some View {
        ZStack() {
            Path() { path in
                //MARK: 起始点坐标
                path.move(to: CGPoint(x: 5, y: 5))
                //MARK: 多长，y轴不变，x轴自定义
                path.addLine(to: CGPoint(x: width - 5, y: 5))
                //MARK: 多宽，此时x是400而不是20，X轴不变，y轴自定义
                path.addLine(to: CGPoint(x: width - 5, y: height - 100))
                //MARK: 此时x是20，y轴300，x轴和y轴不能自定义
                path.addLine(to: CGPoint(x: 5, y: height - 100))
                
                path.closeSubpath()
                
            }
            .stroke(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)),lineWidth: 5)
            
            Path() { path in
                //MARK: 起始点坐标
                path.move(to: CGPoint(x: 20, y: 20))
                //MARK: 多长，y轴不变，x轴自定义
                path.addLine(to: CGPoint(x: width - 20, y: 20))
                //MARK: 多宽，此时x是400而不是20，X轴不变，y轴自定义
                path.addLine(to: CGPoint(x: width - 20, y: height - 120))
                //MARK: 此时x是20，y轴300，x轴和y轴不能自定义
                path.addLine(to: CGPoint(x: 20, y: height - 120))
                
                path.closeSubpath()
                
            }
            .stroke(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)),lineWidth: 5)
            
            Path() { path in
                //MARK: 起始点坐标
                path.move(to: CGPoint(x: 35, y: 35))
                //MARK: 多长，y轴不变，x轴自定义
                path.addLine(to: CGPoint(x: width - 35, y: 35))
                //MARK: 多宽，此时x是400而不是20，X轴不变，y轴自定义
                path.addLine(to: CGPoint(x: width - 35, y: height - 140))
                //MARK: 此时x是20，y轴300，x轴和y轴不能自定义
                path.addLine(to: CGPoint(x: 35, y: height - 140))
                
                path.closeSubpath()
                
            }
            .stroke(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)),lineWidth: 5)
            
            
            Path() { path in
                //MARK: 起始点坐标
                path.move(to: CGPoint(x: 50, y: 50))
                //MARK: 多长，y轴不变，x轴自定义
                path.addLine(to: CGPoint(x: width - 50, y: 50))
                //MARK: 多宽，此时x是400而不是20，X轴不变，y轴自定义
                path.addLine(to: CGPoint(x: width - 50, y: height - 160))
                //MARK: 此时x是20，y轴300，x轴和y轴不能自定义
                path.addLine(to: CGPoint(x: 50, y: height - 160))
                
                path.closeSubpath()
                
            }
            .stroke(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),lineWidth: 5)
            
            Path() { path in
                //MARK: 起始点坐标
                path.move(to: CGPoint(x: 65, y: 65))
                //MARK: 多长，y轴不变，x轴自定义
                path.addLine(to: CGPoint(x: width - 65, y: 65))
                //MARK: 多宽，此时x是400而不是20，X轴不变，y轴自定义
                path.addLine(to: CGPoint(x: width - 65, y: height - 180))
                //MARK: 此时x是20，y轴300，x轴和y轴不能自定义
                path.addLine(to: CGPoint(x: 65, y: height - 180))
                
                path.closeSubpath()
                
            }
            .stroke(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)),lineWidth: 5)
        }
    }
}

struct Path2_Previews: PreviewProvider {
    static var previews: some View {
        Path2()
    }
}

