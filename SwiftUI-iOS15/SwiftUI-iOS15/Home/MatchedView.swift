//
//  MatchedView.swift
//  SwiftUI-iOS15
//
//  Created by Cheney on 2022/3/8.
//

import SwiftUI

struct MatchedView: View {
    
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 12) {
                        Text("SwiftUI")
                            .font(.largeTitle.weight(.bold))
                            .matchedGeometryEffect(id: "title", in: namespace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("20 课时 - 3 小时".uppercased())
                            .font(.footnote.weight(.semibold))
                            .matchedGeometryEffect(id: "subtitle", in: namespace)
                        Text("使用SwiftUI如何编译，动画，手势等".uppercased())
                            .font(.footnote)
                            .matchedGeometryEffect(id: "text", in: namespace)
                    }
                    .padding(20)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .blur(radius: 30)
                            .matchedGeometryEffect(id: "blur", in: namespace)
                    )
                    
                }
                .foregroundColor(.white)
                .background(
                    Image("Illustration 9")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image", in: namespace)
                )
                .background(
                    Image("Background 5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .matchedGeometryEffect(id: "mask", in: namespace)
                )
                .frame(height: 300)
                .padding(20)
            }else{
                ScrollView {
                    VStack {
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 500)
                    .foregroundColor(.black)
                    .background(
                        Image("Illustration 9")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .matchedGeometryEffect(id: "image", in: namespace)
                    )
                    .background(
                        Image("Background 5")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: "background", in: namespace)
                    )
                    .mask(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .matchedGeometryEffect(id: "mask", in: namespace)
                    )
                    .overlay(
                        VStack(alignment: .leading, spacing: 12){
                            Text("SwiftUI")
                                .font(.largeTitle.weight(.bold))
                                .matchedGeometryEffect(id: "title", in: namespace)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("20 课时 - 3 小时".uppercased())
                                .font(.footnote.weight(.semibold))
                                .matchedGeometryEffect(id: "subtitle", in: namespace)
                            Text("使用SwiftUI如何编译，动画，手势等".uppercased())
                                .font(.footnote)
                                .matchedGeometryEffect(id: "text", in: namespace)
                            Divider()
                            HStack {
                                Image("Avatar Default")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .cornerRadius(10)
                                    .padding(8)
                                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18,style: .continuous))
                                    .strokeStyle(cornerRadius: 18)
                                Text("金亮")
                                    .font(.footnote)
                            }
                        }
                            .padding(20)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .matchedGeometryEffect(id: "blur", in: namespace)
                            )
                            .offset(y: 250)
                            .padding(20)
                    )
                }
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
