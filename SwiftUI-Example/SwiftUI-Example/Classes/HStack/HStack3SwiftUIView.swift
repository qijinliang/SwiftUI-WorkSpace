//
//  HStack3SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/17.
//

import SwiftUI

struct HStack3SwiftUIView: View {
    var body: some View {
        VStack(spacing: 10){
            Text("HStack")
                .font(.largeTitle)
                .foregroundColor(.white)
            Text("Vertical Alignment")
                .font(.largeTitle)
                .foregroundColor(.gray)
            VStack() {
                Text("By default,views within an HStack are vertically aligned in the center.")
            }
            .padding()
            .font(.title)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            
            HStack(){
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("Trailing")
            }
            .font(.title3)
            .foregroundColor(.white)
            //MARK: 添加边框
            .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous).stroke(Color.orange,lineWidth: 1))
            
            HStack(alignment: .top){
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Top")
                Spacer()
                Text("Trailing")

            }
            .font(.title3)
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(Color.orange,lineWidth: 1)
            )
            
            HStack(alignment: .bottom) {
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Bottom")
                Spacer()
                Text("Trailing")
            }
            .overlay(
                RoundedRectangle(cornerRadius: 5,style: .continuous).stroke(Color.orange, lineWidth: 1)
            )
            .font(.title3)
            .foregroundColor(.white)
        }
    }
}

struct HStack3SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HStack3SwiftUIView().preferredColorScheme(.dark)
    }
}
