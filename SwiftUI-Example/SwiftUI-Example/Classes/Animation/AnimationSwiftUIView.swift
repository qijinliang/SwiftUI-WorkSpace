//
//  AnimationSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/11.
//

import SwiftUI

struct AnimationSwiftUIView: View {
    var body: some View {
        ExampleView()
    }
}

struct ExampleView: View {
    @State private var flag: Bool = true
    var body: some View {
        HStack {
            if flag {
                Rectangle().fill(Color.green).frame(width: 100, height: 100)
            }
            Spacer()
            Button("Switch") {
                withAnimation(.easeInOut(duration: 2.0)) {
                    flag.toggle()
                }
            }
            Spacer()
            
            if !flag {
                Circle().fill(Color.blue).frame(width: 50, height: 50)
            }
        }.frame(width: 400)
    }
}

struct AnimationSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationSwiftUIView()
    }
}
