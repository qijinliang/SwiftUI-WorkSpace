//
//  ListView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("List")
                .font(.largeTitle)
            Text("Static Data")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack() {
                Text("You can show static views or data within the List View view. it does not have to be bound with data It gives you a scrollable view.")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            
            List() {
                Text("Line One")
                Text("Line Two")
                Text("Line Three")
                //MARK: - uiImage输入image Literal即可选择图片
                Image.init(uiImage: #imageLiteral(resourceName: "栀宝5")).resizable().aspectRatio(contentMode: .fit).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Button.init("Click Here", action: {
                    print("Click Here....")
                })
                .foregroundColor(.green)
                HStack() {
                    Spacer()
                    Text("Centered Text")
                    Spacer()
                }
                
            }.font(.title)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().preferredColorScheme(.dark)
    }
}
