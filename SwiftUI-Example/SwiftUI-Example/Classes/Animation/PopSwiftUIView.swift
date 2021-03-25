//
//  PopSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/11.
//

import SwiftUI

struct PopSwiftUIView: View {
    @State var show = false
    var body: some View {
        ZStack {
            
            VStack {
                Text("Push")
                    .font(.title).bold()
                    .foregroundColor(.white)
            }
            .frame(width: 300, height: 400)
            .background(Color.pink)
            .cornerRadius(20)
            .onTapGesture {
                withAnimation(.spring()) {
                    show.toggle()
                }
            }
            if show {
                NewView(show: $show)
                    .transition(.move(edge: .top))
                    .zIndex(1)
            }
        }
    }
}

struct NewView: View {
    @Binding var show : Bool
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color(#colorLiteral(red: 0.9529411764705882, green: 0.6862745098039216, blue: 0.13333333333333333, alpha: 1.0)))
            .frame(width: 500, height: 400)
            .onTapGesture {
                withAnimation(.easeOut) {
                    show.toggle()
                }
            }
            .padding()
    }
}

struct PopSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PopSwiftUIView()
    }
}
