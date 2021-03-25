//
//  LineGraphSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/11.
//

import SwiftUI

struct LineGraph: Shape {
    var dataPoints: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        func point(at ix: Int) -> CGPoint {
            let point = dataPoints[ix]
            let x = rect.width * CGFloat(ix) / CGFloat(dataPoints.count - 1)
            let y = (1 - point) * rect.height
            return CGPoint(x: x, y: y)
        }
        
        return Path { p in
            guard dataPoints.count > 1 else { return }
            let start = dataPoints[0]
            p.move(to: CGPoint(x: 0, y: (1 - start) * rect.height))
            for idx in dataPoints.indices {
                p.addLine(to: point(at: idx))
            }
        }
    }
}


struct LineGraphSwiftUIView: View {
    @State var on = true
    let sampleData: [CGFloat] = [0.1, 0.7, 0.3, 0.6, 0.45, 1.1]
    var body: some View {
        VStack {
            LineGraph(dataPoints: sampleData)
                .trim(to: on ? 1 : 0)
                .stroke(Color.red, lineWidth: 2)
                .aspectRatio(16/9, contentMode: .fit)
                .border(Color.gray, width: 1)
                .padding()
            Button("Animate") {
                withAnimation(.easeInOut(duration: 2)) {
                    self.on.toggle()
                }
            }
        }
    }
}


struct LineGraphSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LineGraphSwiftUIView()
    }
}
