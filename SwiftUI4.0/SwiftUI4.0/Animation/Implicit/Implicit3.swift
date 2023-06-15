//
//  Implicit3.swift
//  SwiftUI3.0-Example
//
//  Created by 金亮 on 2021/9/26.
//

import SwiftUI

struct Implicit3: View {
    @State var dragOffset: CGSize = .zero
    @State var show = false
    @ObservedObject var manager = MotionManager()
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(show ? .ultraThinMaterial : .ultraThickMaterial)
                .overlay(Rectangle().fill(.black.opacity(0.5)).blendMode(.softLight))
                .mask(
                    canvas.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                )
                .shadow(color: .white.opacity(0.2), radius: 0, x: -1, y: -1)
                .shadow(color: .black.opacity(0.2), radius: 0, x: 1, y: 1)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 10, y: 10)
                .overlay(
                    ZStack {
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .rotationEffect(.degrees(show ? 45 : 0), anchor: .center)
                            .foregroundColor(.white)
                            .offset(x: -28, y: -28)
                        
                        Group {
                            Image(systemName: "bubble.left.fill")
                                .foregroundColor(.white)
                                .offset(x: -28, y: -128)
                            
                            Image(systemName: "moon.fill")
                                .foregroundColor(.white)
                                .offset(x: -128, y: -28)
                            
                            Image(systemName: "quote.opening")
                                .foregroundColor(.white)
                                .offset(x: -113, y: -113)
                        }
                        .blur(radius: show ? 0 : 10)
                        .opacity(show ? 1 : 0)
                        .scaleEffect(show ? 1 : 0.5)
                    }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                )
                .background(
                    circle.frame(width: 208)
                        .overlay(circle.frame(width: 60))
                        .overlay(circle.frame(width: 80))
                        .offset(x: 60, y: 60)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .scaleEffect(show ? 1 : 0.8, anchor: .bottomTrailing)
                        .opacity(show ? 1 : 0)
                        .animation(.easeOut(duration: 0.3), value: show)
                )
                .offset(y: -29)
                .onTapGesture {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                        show.toggle()
                    }
                }
                .gesture(drag)
        }
        .background(
            ZStack {
                Image("Background 1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(.linearGradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.501008899)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7990480132)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: abs(manager.roll) * 5, y: abs(manager.roll) * 5)))
                            .opacity(show ? 1 : 0)
                    )
                    .overlay(
                        ZStack {
                            LinearGradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5086403146)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: manager.roll * 10, y: manager.roll * 10))
                                .cornerRadius(50)
                                .opacity(show ? 1 : 0)
                        }
                    )
                    .scaleEffect(show ? 0.8 : 1)
                    .rotation3DEffect(.degrees(show ? 20 : 0), axis: (x: 1-manager.pitch, y: manager.roll, z: 0))
                    .shadow(color: .black.opacity(0.5), radius: 50, x: 0, y: 50)
                
                LinearGradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .opacity(show ? 1 : 0)
                    .blendMode(.overlay)
            }
        )
        .background(.gray)
        .ignoresSafeArea()
    }
    
    var circle: some View {
        Circle().stroke(lineWidth: 1).fill(.linearGradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    var canvas: some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.8, color: .blue))
            context.addFilter(.blur(radius: 10))
            context.drawLayer { ctx in
                for index in 1...5 {
                    if let resolvedView = context.resolveSymbol(id: index) {
                        ctx.draw(resolvedView, at: CGPoint(x: size.width - 44, y: size.height - 44))
                    }
                }
            }
        } symbols: {
            Circle()
                .fill(.black)
                .frame(width: 76, height: 76)
                .tag(1)
            Circle()
                .fill(.black)
                .frame(width: 76, height: 76)
                .offset(dragOffset)
                .tag(2)
            Circle()
                .fill(.black)
                .frame(width: 76, height: 76)
                .offset(y: show ? -100 : 0)
                .tag(3)
            Circle()
                .fill(.black)
                .frame(width: 76, height: 76)
                .offset(x: show ? -100 : 0)
                .tag(4)
            Circle()
                .fill(.black)
                .frame(width: 76, height: 76)
                .offset(x: show ? -84 : 0, y: show ? -84 : 0)
                .tag(5)
        }
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                dragOffset = value.translation
            }
            .onEnded { value in
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                    dragOffset = .zero
                }
            }
    }
}


struct Implicit3_Previews: PreviewProvider {
    static var previews: some View {
        Implicit3()
    }
}
