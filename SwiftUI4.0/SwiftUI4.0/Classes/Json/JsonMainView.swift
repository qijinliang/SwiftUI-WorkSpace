//
//  JsonMainView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/26.
//

import SwiftUI

struct JsonMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: JsonShowView()) {
                Text("数据解析")
            }
        }
    }
}

struct JsonMainView_Previews: PreviewProvider {
    static var previews: some View {
        JsonMainView()
    }
}
