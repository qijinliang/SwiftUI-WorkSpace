//
//  WikiButton.swift
//  SwiftUI-WikiApp
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//
import SwiftUI

struct WikiButton: View {

    let screenSize = UIScreen.main.bounds.size
    var icon = "plus"
    var color = "green"
    var text = "创建新的百科"
    var isFolder = false
    var action: (()->()) = {}
    
    var body: some View {
        let screenWidth = screenSize.width
        
        return Button(action: {
            self.action()
        }) {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(isFolder ? Color(color) : Color.white)
                
                Text(text)
                    .foregroundColor(isFolder ? Color(color) : Color.white)
                
            }.frame(width: screenWidth * 0.7 )
                .padding(.vertical)
                .background(Color(color).opacity(isFolder ? 0.2 : 1))
                .cornerRadius(10)
        }
    }
}

struct WikiButton_Previews: PreviewProvider {
    static var previews: some View {
        WikiButton()
    }
}
