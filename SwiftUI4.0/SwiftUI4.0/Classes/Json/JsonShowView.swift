//
//  JsonShowView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/26.
//

import SwiftUI

struct JsonShowView: View {
    var body: some View {
        Form {
            Section(header: Text("数据解析").font(.title3).fontWeight(.heavy)) {
                NavigationLink(destination: JsonSwiftUIView()) {
                    Text("并发数据解")
                }
                
                
                NavigationLink(destination: Json2SwiftUIView()) {
                    Text("复杂模型嵌套模型解析")
                }
            }
        }
    }
}


struct JsonShowView_Previews: PreviewProvider {
    static var previews: some View {
        JsonShowView()
    }
}
