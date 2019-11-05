//
//  ContentView.swift
//  Calculator
//
//  Created by Jerry on 2019/11/5.
//  Copyright © 2019 QijinLiang. All rights reserved.
//

import SwiftUI

//注释解释

//: .font(.title)
//将文本字体设置为font.title，除了title以外，还定义一系列字体
  //比如.headline .body等，具体按数值指定字号的话，可以使用.font(.system(size:48))方式
  //自定义字体.font(.custom("Copperplate",size:48))

struct ContentView: View {
    var body: some View {
    
        HStack() {
            Text("+")
                .background(Color.orange)
                .font(.title)
                .padding()
                .foregroundColor(.white)
            Text("+")
                .background(Color.orange)
                .font(.title)
                .padding()
                .foregroundColor(.white)
            Text("+")
                .background(Color.orange)
                .font(.title)
                .padding()
                .foregroundColor(.white)
            Text("+")
                .background(Color.orange)
                .font(.title)
                .padding()
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
