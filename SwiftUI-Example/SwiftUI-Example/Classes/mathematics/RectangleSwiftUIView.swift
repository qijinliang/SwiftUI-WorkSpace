//
//  RectangleSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/11.
//

import SwiftUI


struct RectangleSwiftUIView: View {
    
    var body: some View {
        PolygonShape(sides: 3).stroke(Color(#colorLiteral(red: 0.8549019607843137, green: 0.25098039215686274, blue: 0.47843137254901963, alpha: 1.0)), lineWidth: 3)
        PolygonShape(sides: 4).stroke(Color(#colorLiteral(red: 0.9411764705882353, green: 0.4980392156862745, blue: 0.35294117647058826, alpha: 1.0)), lineWidth: 4)
        
    }
}

struct PolygonShape: Shape {
    
    var sides: Int
    
    
    func path(in rect: CGRect) -> Path {
        
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0
        
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        
        var path = Path()
        
        for i in 0..<sides {
            let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
            
            if i == 0 {
                path.move(to: pt)
            }else {
                path.addLine(to: pt)
            }
        }
        path.closeSubpath()
        
        return path
    }
}
struct RectangleSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleSwiftUIView().preferredColorScheme(.dark)
    }
}
