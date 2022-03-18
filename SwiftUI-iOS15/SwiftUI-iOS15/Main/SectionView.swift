//
//  SectionView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/17.
//

import SwiftUI

struct SectionView: View {
    var section: CourseSection = courseSections[0]
    @EnvironmentObject var model: Model
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                    .overlay(PlayView().overlay(CircularView(value: section.progress, lineWidth: 5).padding(24)))
                
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            
            button
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
            Image(section.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .frame(maxWidth: 500)
        )
        .background(
            Image(section.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .mask(
            RoundedRectangle(cornerRadius: 0, style: .continuous)
        )
        .overlay(
            overlayContent
        )
        .frame(height: 500)
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("SwiftUI")
                .font(.title3).fontWeight(.medium)
            Text("介绍")
                .font(.title).bold()
            Text("借助 SwiftUI，您可以利用 Swift 的强大功能打造适合各个 Apple 平台的精美 app，而无需编写大量代码。SwiftUI 让您只需使用一套工具和 API，就能在任何 Apple 设备上为所有用户带来更加出色的体验。")
            Text("您可以利用新功能增强您的 app，例如改进的列表视图、更好的搜索体验，以及对控制专注模式的支持。此外，还可以利用新的画布 API 这个 drawRect 的现代 GPU 加速替代方案，提高对底层绘图语言的控制。")
                .font(.title).bold()
            Text("SwiftUI 采用声明式语法，您只需声明用户界面应具备的功能便可。例如，您可以写明您需要一个由文本栏组成的项目列表，然后描述各个栏位的对齐方式、字体和颜色。您的代码比以往更加简单直观和易于理解，可以节省您的时间和维护工作。")
        }
        .padding(20)
    }
    
    var button: some View {
        Button {
            dismiss()
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
    
    var overlayContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(section.title)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(section.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
            Text(section.text)
                .font(.footnote)
            Divider()
                .opacity(0)
            HStack {
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
                Text("作者 醉看红尘这场梦")
                    .font(.footnote)
            }
            .opacity(0)
        }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            )
            .offset(y: 250)
            .padding(20)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView()
    }
}
