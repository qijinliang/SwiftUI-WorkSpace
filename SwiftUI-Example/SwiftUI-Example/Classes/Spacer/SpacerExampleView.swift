//
//  SpacerExampleView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/5/14.
//

import SwiftUI

struct SpacerExampleView: View {
    var body: some View {
        HStack(spacing: 10) {
            
            Image.init(systemName: "gamecontroller.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.red)
                .frame(width: 100, height: 100)
            VStack(alignment: .leading,spacing: 10) {
                Text("Hello, World!").fontWeight(.bold)
                //MARK: - 可以当做面试题目，为什么Text之间添加Space()会占据整个屏幕，不是应该在HStack里面吗？
                //MARK: - 由于尚未HStakc指定高度，因此这里会占据整个屏幕，为了确保不会超出HStack的空间，可以设置一个frame高度
//                Spacer()
                Text("Space")
            }
            .font(.body)
        }
        .padding()
//        .frame(width: 200, height: 300)
    }
}

struct SpacerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        SpacerExampleView()
    }
}
