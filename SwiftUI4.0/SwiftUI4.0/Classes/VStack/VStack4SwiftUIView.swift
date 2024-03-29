//
//  VStack4SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/12.
//

import SwiftUI

struct VStack4SwiftUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("对齐方式")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack() {
                Text("左对齐，右对齐，中心对齐")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            
            VStack(alignment: .leading, spacing: 40) {
                Text("Leading Alignment")
                    .font(.title)
                    .foregroundColor(.white)
                Divider()
                Image.init(systemName: "arrow.left")
            }
            .padding()
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.blue)
            .padding()
            
            VStack(alignment: .trailing, spacing: 40){
                Text("Trailing Alignment")
                    .font(.title)
                Divider()
                Image.init(systemName: "arrow.right")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding()
            
            VStack(alignment: .center,spacing: 40){
                Text("Center").font(.title)
                Spacer()
                Image.init(systemName: "arrow.right")
            }
            .padding()
            .frame(maxWidth: .infinity,minHeight: 150)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct VStack4SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            VStack4SwiftUIView()
            VStack4SwiftUIView().preferredColorScheme(.dark)
        }
    }
}
