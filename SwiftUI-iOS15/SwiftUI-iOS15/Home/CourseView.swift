//
//  CourseView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/8.
//

import SwiftUI

struct CourseView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    @State var appear = [false, false, false]
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
                    .opacity(appear[2] ? 1 : 0)
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            
            button
        }
        .onAppear {
            fadeIn()
        }
        .onChange(of: show) { newValue in
            fadeOut()
        }
    }
    
    var cover: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(.black)
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
            VStack(alignment: .leading, spacing: 12) {
                Text("SwiftUI学习")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("20 课时 - 3 小时".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text("使用SwiftUI在iOS15系统下制作App")
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text", in: namespace)
                Divider()
                    .opacity(appear[0] ? 1 : 0)
                HStack {
                    Image("Avatar Default")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .cornerRadius(10)
                        .padding(8)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .strokeStyle(cornerRadius: 18)
                    Text("金亮")
                        .font(.footnote)
                }
                .opacity(appear[1] ? 1 : 0)
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
    
    var content: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("SwiftUI 的新功能")
                .font(.title3).fontWeight(.medium)
            Text("介绍")
                .font(.title).bold()
            Text("SwiftUI 采用声明式语法，您只需声明用户界面应具备的功能便可。例如，您可以写明您需要一个由文本栏组成的项目列表，然后描述各个栏位的对齐方式、字体和颜色。您的代码比以往更加简单直观和易于理解，可以节省您的时间和维护工作。")
            Text("新的性能与 API 可用性改进，包括多列表格支持，让您的 macOS app 变得更加出色。")
            Text("先进的 app 体验和工具")
                .font(.title).bold()
            Text("您可以利用新功能增强您的 app，例如改进的列表视图、更好的搜索体验，以及对控制专注模式的支持。此外，还可以利用新的画布 API 这个 drawRect 的现代 GPU 加速替代方案，提高对底层绘图语言的控制。")
        }
        .padding(20)
    }
    
    var button: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
    
    func fadeIn() {
        withAnimation(.easeOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[2] = true
        }
    }
    
    func fadeOut() {
        appear[0] = false
        appear[1] = false
        appear[2] = false
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseView(namespace: namespace, show: .constant(true))
    }
}
