//
//  ContentView.swift
//  SwiftUI-Layout
//
//  Created by Jerry on 2019/11/6.
//  Copyright © 2019 QijinLiang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
           Color.green.edgesIgnoringSafeArea(.all)
           FrontView()
        }
    }
}

struct FrontView: View {
    var body: some View {
        VStack (spacing: 12) {
            HStack {
                Text("Hello World")
                    .font(.system(size: 24))
                    .padding(.horizontal,12)
                    .padding(.vertical,8)
                    .background(Color.red)
                Spacer().frame(height: 10)
                        .background(Color.green)
            }.background(Color.blue)
            
            Spacer().frame(width: 10)
                    .background(Color.green)
            HStack{
                Spacer().frame(height: 10)
                        .background(Color.green)
                Text("Hello World")
                    .font(.system(size: 24))
                    .padding(.horizontal,12)
                    .padding(.vertical,8)
                    .background(Color.red)
            }.background(Color.blue)
            
        }.background(Color.yellow)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
