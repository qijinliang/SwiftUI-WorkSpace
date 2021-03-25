//
//  Spacer3SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/20.
//

import SwiftUI

struct Spacer3SwiftUIView: View {
    var body: some View {
        VStack(spacing: 20){
            Text("Spacer")
                .foregroundColor(.white)
            Text("Minimum Length")
                .foregroundColor(.gray)
            
            VStack() {
                Text("You can set a minimum space to exist betwwen views using the minLenght modifiler on the Space")
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(#colorLiteral(red: 1, green: 0.8403585553, blue: 0.02657423913, alpha: 1)))
            
            Text("No minLength set (system default is used)")
                //MARK: 字体变粗
                .bold()
                .font(.title3)
            VStack(){
                HStack(){
                    Image.init("胡歌1").resizable().aspectRatio(contentMode: .fit)
                    Spacer()
                    Text("The is Yousemit National Park")
                        .font(.title3)
                        //MARK: 设置默认一行
                        .lineLimit(1)
                }
                .padding()
                Text("minLenght = 0")
                    .font(.title2)
                    .bold()
                HStack(){
                    Image.init("胡歌1").resizable().aspectRatio(contentMode: .fit)
                    Spacer(minLength: 0)
                    Text("The is Yousemit National Park")
                        .font(.title3)
                        //MARK: 设置默认一行
                        .lineLimit(1)
                }
                .padding()
                Text("minLenght = 40")
                    .font(.title2)
                    .bold()
                HStack(){
                    Image.init("胡歌1").resizable().aspectRatio(contentMode: .fit)
                    Spacer(minLength: 40)
                    Text("The is Yousemit National Park")
                        .font(.title3)
                        //MARK: 设置默认一行
                        .lineLimit(1)
                }
                .padding()
            }
        }
        .font(.largeTitle)
    }
}

struct Spacer3SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Spacer3SwiftUIView().preferredColorScheme(.dark)
    }
}
