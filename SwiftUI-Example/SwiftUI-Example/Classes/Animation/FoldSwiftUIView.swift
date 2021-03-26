//
//  FoldSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/11.
//

import SwiftUI

struct FoldSwiftUIView: View {
    
    
    var body: some View {
        VStack {
            FoldAnimationView()
        }
    }
}

struct FoldAnimationView: View {
    
    @State var show = false
    
    var body: some View {
        
        VStack {
            Text("Apple of the day")
                .font(.title).bold()
                .foregroundColor(.white)
        }
        .frame(width: 300, height: 400)
        .background(Color.pink)
        .cornerRadius(20)
        .opacity(show ? 1 : 0.5)
        .padding(show ? 16 : 32)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .animation(.spring(response: 0.5, dampingFraction: 0.4))
        .onTapGesture {
            show.toggle()
        }
    }
}
struct FoldSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FoldSwiftUIView()
    }
}
