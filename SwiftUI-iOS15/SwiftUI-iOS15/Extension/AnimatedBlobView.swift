//
//  AnimatedBlobView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/18.
//

import SwiftUI

struct AnimatedBlobView: View {
    @State var appear = false
    
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let now = timeline.date.timeIntervalSinceReferenceDate
                let angle1 = cos(Angle.degrees(now.remainder(dividingBy: 3) * 60).radians)
                let angle2 = cos(Angle.degrees(now.remainder(dividingBy: 6) * 10).radians)
                
                var path = Path()
                let width = 390.0
                let height = 414.0
                path.move(to: CGPoint(x: 0.9923*width, y: 0.42593*height))
                path.addCurve(to: CGPoint(x: 0.6355*width*angle2, y: height), control1: CGPoint(x: 0.92554*width*angle2, y: 0.77749*height*angle2), control2: CGPoint(x: 0.91864*width*angle2, y: height))
                path.addCurve(to: CGPoint(x: 0.08995*width, y: 0.60171*height), control1: CGPoint(x: 0.35237*width*angle1, y: height), control2: CGPoint(x: 0.2695*width, y: 0.77304*height))
                path.addCurve(to: CGPoint(x: 0.34086*width, y: 0.06324*height*angle1), control1: CGPoint(x: -0.0896*width, y: 0.43038*height), control2: CGPoint(x: 0.00248*width, y: 0.23012*height*angle1))
                path.addCurve(to: CGPoint(x: 0.9923*width, y: 0.42593*height), control1: CGPoint(x: 0.67924*width, y: -0.10364*height*angle1), control2: CGPoint(x: 1.05906*width, y: 0.07436*height*angle2))
                path.closeSubpath()
                
                context.fill(path, with: .linearGradient(Gradient(colors: [.pink, .blue]), startPoint: .init(x: 0, y: 0), endPoint: .init(x: 400, y: 400)))
            }
        }
        .rotationEffect(.degrees(appear ? 360 : 0))
        .onAppear {
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                appear = true
            }
        }
    }
}

struct AnimatedBlobView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBlobView()
    }
}
