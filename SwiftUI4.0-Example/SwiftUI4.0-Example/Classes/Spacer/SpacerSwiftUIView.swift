//
//  SpacerSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/19.
//

import SwiftUI

struct SpacerSwiftUIView: View {
    var body: some View {
        VStack(){
            Text("Spacer")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack(){
                Text("Spacer push things aways either vertically or horizontally")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color(#colorLiteral(red: 1, green: 0.8403585553, blue: 0.02657423913, alpha: 1)))
            Image.init(systemName: "arrow.up.circle.fill").font(.title)
            Spacer()
            Image.init(systemName: "arrow.down.circle.fill").font(.title)
            HStack(){
                Text("Horizontal Space")
                    .font(.title)
                Image.init(systemName: "arrow.left.circle.fill").font(.title)
                Spacer()
                Image.init(systemName: "arrow.right.circle.fill").font(.title)
            }
            .padding(.horizontal)
            Color.yellow.frame(maxHeight: 50)
        }
    }
}

struct SpacerSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SpacerSwiftUIView().preferredColorScheme(.dark)
    }
}
