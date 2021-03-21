//
//  GeometryReader5SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/21.
//

import SwiftUI

struct GeometryReader5SwiftUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("GeometryReader")
                .font(.largeTitle)
            Text("Getting Coordinates")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("Getting the coordinates (x,y)of a geometry view is little different Take a look at this examplex.")
            
            GeometryReader() { geometryProxy in
                VStack(spacing: 20) {
                    Text("\(geometryProxy.frame(in: CoordinateSpace.local).origin.x)")
                    Text("\(geometryProxy.frame(in: CoordinateSpace.local).origin.y)")
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.pink)
            
            Text("The local coordinate space will always give you zeros.You need to look globally to get the coordinates inside the current view:")
            
            GeometryReader() { geometryProxy in
                VStack(alignment: .leading,spacing: 20) {
                    Text("\(geometryProxy.frame(in: CoordinateSpace.global).origin.x)")
                    Text("\(geometryProxy.frame(in: CoordinateSpace.global).origin.y)")
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.pink)
        }
        .padding(.horizontal)
        .font(.title)
    }
}

struct GeometryReader5SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader5SwiftUIView()
    }
}
