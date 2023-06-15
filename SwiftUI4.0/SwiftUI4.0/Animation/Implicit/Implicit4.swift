//
//  Implicit4.swift
//  SwiftUI4.0
//
//  Created by 金亮 on 2023/6/15.
//

import SwiftUI

struct Implicit4: View {
    @State var time = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var showMessage = true
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "timelapse", variableValue: time)
                .imageScale(.large)
                .font(.system(size: 50).weight(.thin))
                .onReceive(timer) { _ in
                    if time < 1.0 {
                        time += 0.1
                    } else {
                        time = 0.0
                    }
                }
            Text("Switching apps".uppercased())
                .font(.system(size: 34, weight: .bold, width: .condensed))
            Text("Tap and hold any part of the screen for 1 second to show the menu for switching between apps.")
                .fontWeight(.medium)
                .frame(maxWidth: .infinity)
                .foregroundColor(.secondary)
            Divider()
            Button {
                withAnimation {
                    showMessage = false
                }
            } label: {
                Text("Got it")
                    .fontWeight(.medium)
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke())
                    .accentColor(.primary)
            }
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal, 30)
        .padding(.vertical, 40)
        .background(.ultraThinMaterial)
        .cornerRadius(30)
        .padding(30)
        .opacity(showMessage ? 1 : 0)
        .offset(y: showMessage ? 0 : 200)
        .blur(radius: showMessage ? 0 : 20)
    }
}

struct Implicit4_Previews: PreviewProvider {
    static var previews: some View {
        Implicit4()
    }
}
