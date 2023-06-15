//
//  Gesture2SwiftUIView.swift
//  SwiftUI4.0
//
//  Created by 金亮 on 2023/6/15.
//

import SwiftUI


struct Gesture2SwiftUIView: View {
    @State var position: CGSize = .zero
    
    var body: some View {
        ZStack {
            wallpaper
            
            ZStack {
                text.foregroundColor(.white)
                    .blendMode(.difference)
                    .overlay(text.blendMode(.hue))
                    .overlay(text.foregroundColor(.white).blendMode(.overlay))
                    .overlay(text.foregroundColor(.black).blendMode(.overlay))
            }
        }
    }
    
    var text: some View {
        Text("One place to stack all your cards")
            .font(.system(size: 48, weight: .heavy, width: .expanded))
            .bold()
            .padding(20)
            .frame(width: 390)
    }
    
    var wallpaper: some View {
        Image("Background 1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .offset(x: 300)
            .offset(x: position.width, y: position.height)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        position = value.translation
                    }
                    .onEnded { value in
                        withAnimation {
                            position = .zero
                        }
                    }
            )
    }
}

struct BlendingModesView_Previews: PreviewProvider {
    static var previews: some View {
        Gesture2SwiftUIView()
    }
}

extension Font {
    static func system(
        size: CGFloat,
        weight: UIFont.Weight,
        width: UIFont.Width) -> Font {
        return Font(
            UIFont.systemFont(
                ofSize: size,
                weight: weight,
                width: width)
        )
    }
}
