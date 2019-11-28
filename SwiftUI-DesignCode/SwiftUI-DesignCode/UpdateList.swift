//
//  UpdateList.swift
//  SwiftUI-DesignCode
//
//  Created by Jerry on 2019/11/26.
//  Copyright © 2019 QijinLiang. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    
    var updates = updateData
    
    @ObservedObject var store = UpdateStore(updates: updateData)
    
    func addUpdate() {
        store.updates.append(Update(image: "Certofocate1", title: "新的标题", text: "新的内容", date: "JUL 1"))
    }
    
    func move(from source: IndexSet, to destination: Int) {
        store.updates.swapAt(source.first!, destination)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { item in
                    NavigationLink(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)) {
                        HStack(spacing: 12.0) {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color("background"))
                                .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                
                                Text(item.text)
                                    .lineLimit(2)
                                    .lineSpacing(4)
                                    .frame(height: 50.0)
                                    .font(.subheadline)
                                
                                Text(item.date)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.vertical, 8.0)
                }
                .onDelete { index in
                    self.store.updates.remove(at: index.first!)
                }
                .onMove(perform: move)
            }
                
            .navigationBarTitle(Text("更新"))
            .navigationBarItems(
                leading: Button(action: addUpdate)  { Text("添加更新") },
                trailing: EditButton()
            )
        }
        
        
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}


struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Illustration1", title: "SwiftUI", text: "了解如何使用高级组合、布局、图形和动画在SwiftUI中构建自定义视图和控件。看看一个高性能的演示，动画控制和观看它一步一步在代码。对SwiftUI的布局系统有了更深入的了解。", date: "JUN 26"),
    Update(image: "Illustration2", title: "Framer X", text: "了解如何使用高级组合、布局、图形和动画在SwiftUI中构建自定义视图和控件。看看一个高性能的演示，动画控制和观看它一步一步在代码。对SwiftUI的布局系统有了更深入的了解。", date: "JUN 11"),
    Update(image: "Illustration3", title: "CSS Layout", text: "学习如何结合CSS网格，Flexbox，动画和响应设计在CodePen创建一个美丽的原型。", date: "MAY 26"),
    Update(image: "Illustration4", title: "React Native Part 2", text: "学习如何实现手势，Lottie动画和Firebase登录。", date: "MAY 15"),
    Update(image: "Certificate1", title: "Unity", text: "统一课程教学基础，c#，资产，水平设计和游戏", date: "MAR 19"),
    Update(image: "Certificate2", title: "React Native for Designers", text: "使用自定义动画、Redux和API数据构建自己的iOS和Android应用程", date: "FEB 14"),
    Update(image: "Certificate3", title: "Vue.js", text: "制作一个仪表板web应用程序，包括完整的登录系统、暗模式和动态图表。", date: "JAN 23")
]
