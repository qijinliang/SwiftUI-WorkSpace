//
//  ModalView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/15.
//

import SwiftUI

struct ModalView: View {
    @EnvironmentObject var model: Model
    @State var appear = false
    @State var appearBackground = false
    @State var viewState = CGSize.zero
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                viewState = value.translation
            }
            .onEnded { value in
                if value.translation.height > 300 {
                    dismissModal()
                } else {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                        viewState = .zero
                    }
                }
            }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.ultraThinMaterial)
                .onTapGesture { dismissModal() }
                .opacity(appear ? 1 : 0)
                .ignoresSafeArea()
            
            GeometryReader { proxy in
                Group {
                    switch model.selectedModal {
                    case .signUp:
                        SignupView(dismissModal: { dismissModal() })
                            
                    case .signIn:
                        SigninView()
                    }
                }
                .rotationEffect(.degrees(viewState.width / 40))
                .rotation3DEffect(.degrees(viewState.height / 20), axis: (x: 1, y: 0, z: 0), perspective: 1)
                .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
                .padding(20)
                .offset(x: viewState.width, y: viewState.height)
                .gesture(drag)
                .frame(maxHeight: .infinity, alignment: .center)
                .offset(y: appear ? 0 : proxy.size.height)
                .background(
                    Image("Blob 1").offset(x: 170, y: -60)
                        .opacity(appearBackground ? 1 : 0)
                        .offset(y: appearBackground ? -10 : 0)
                        .blur(radius: appearBackground ? 0 : 40)
                        .hueRotation(.degrees(viewState.width / 5))
                        .allowsHitTesting(false)
                        .accessibility(hidden: true)
                )
            }
            
            Button {
                dismissModal()
            } label: {
                CloseButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
            .offset(y: appear ? 0 : -100)
        }
        .onAppear {
            withAnimation(.spring()) {
                appear = true
            }
            withAnimation(.easeOut(duration: 2)) {
                appearBackground = true
            }
        }
        .onDisappear {
            withAnimation(.spring()) {
                appear = false
            }
            withAnimation(.easeOut(duration: 1)) {
                appearBackground = true
            }
        }
        .onChange(of: model.dismissModal) { _ in
            dismissModal()
        }
        .accessibilityAddTraits(.isModal)
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .environmentObject(Model())
    }
}

extension ModalView {
    func dismissModal() {
        withAnimation {
            appear = false
            appearBackground = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            model.showModal = false
        }
    }
}
