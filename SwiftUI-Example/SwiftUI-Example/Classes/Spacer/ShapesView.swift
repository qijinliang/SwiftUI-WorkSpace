//
//  ShapesView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/5/14.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        //MARK: - 利用Circle和RoundedRectangle可以更好地填满空间的好方法
        VStack() {
            Circle()
                .overlay(Text("Shapes")
                .foregroundColor(.black))
                .foregroundColor(Color.init(hex: "#AFEEEE"))
            
            RoundedRectangle(cornerRadius: 15)
                .overlay(Text("RoundedRectangle")
                .foregroundColor(Color.black))
                .foregroundColor(Color.init(hex: "FFEBCD"))
            RoundedRectangle(cornerRadius: 15)
                .overlay(Text("RoundedRectangle")
                .foregroundColor(Color.black))
                .foregroundColor(Color.init(hex: "FFEBCD"))
            RoundedRectangle(cornerRadius: 15)
                .overlay(Text("RoundedRectangle")
                .foregroundColor(Color.black))
                .foregroundColor(Color.init(hex: "FFEBCD"))
        }
        .foregroundColor(Color.red)
        .padding()
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}
