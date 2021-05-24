//
//  HUDSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/5/15.
//

import SwiftUI
/*
struct HUDSwiftUIView: View {
    
    @State private var showingHUD = false
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationView {
                Button("Show/hide HUD") {
                    withAnimation {
                        showingHUD.toggle()
                    }
                }
            }
            
            .hud(isPresented: $showingHUD) {
                Label("Five starts", systemImage: "star.fill")
            }
        }
    }
}

//自定义提示框
struct HUD<Content: View>: View {
    @ViewBuilder let content : Content
    
    var body: some View {
        content.padding(.horizontal, 12)
            .padding(16)
            .background(
                Capsule()
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .shadow(color: Color(.black).opacity(0.16), radius: 12, x: 0, y: 5)
            )
    }
}

extension View {
    func hud<Content: View> (
        isPresented: Binding<Bool>,
        @ViewBuilder content: () -> Content
    ) -> some View {
        ZStack(alignment: .top) {
            self
            
            if isPresented.wrappedValue {
                HUD(content: content)
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                isPresented.wrappedValue = false
                            }
                        }
                    }
                    .zIndex(1)
            }
        }
    }
}


struct HUDSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HUDSwiftUIView()
    }
}
 */
