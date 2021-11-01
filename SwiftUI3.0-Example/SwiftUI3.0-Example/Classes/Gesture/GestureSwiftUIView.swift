//
//  GestureSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/11.
//

import SwiftUI

struct GestureSwiftUIView: View{
    
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack{
            BackCardView()
            Image(uiImage: #imageLiteral(resourceName: "栀宝6"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 340, height: 220, alignment: .center)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotation3DEffect(Angle(degrees: 10), axis: (x: 10.0, y: 0, z: 0))
                .animation(.easeInOut(duration: 0.5))
            
            BackCardView()
            Image(uiImage: #imageLiteral(resourceName: "栀宝8"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 340, height: 220, alignment: .center)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle.degrees(show ? 0 : 5))
                .rotation3DEffect(Angle(degrees: 5), axis: (x: 10.0, y: 0, z: 0))
                .animation(.easeInOut(duration: 0.3))
            CardView()
                .offset(x: viewState.width, y: viewState.height)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.show.toggle()
                }
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                        self.show = true
                    }
                    .onEnded { value in
                        self.viewState = .zero
                        self.show = false
                    }
                )
        }
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Image(uiImage: #imageLiteral(resourceName: "栀宝5"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 340, height: 220)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
        .frame(width: 340.0, height: 220.0)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}


struct BackCardView: View {
    var body: some View {
        VStack {
            
            Spacer()
        }
        .frame(width: 340, height: 220)
    }
}


struct GestureSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GestureSwiftUIView()
    }
}
