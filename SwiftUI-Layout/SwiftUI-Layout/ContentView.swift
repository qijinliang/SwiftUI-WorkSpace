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
        
        VStack{
            Text("Hello World").font(.system(size: 24))
                .padding(.horizontal,12)
                .padding(.vertical,8)
        }.background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
