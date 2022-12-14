//
//  ListSetting.swift
//  SwiftUI4.0-Example
//
//  Created by 金亮 on 2022/9/30.
//

import SwiftUI

struct ListSetting: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 246 / 255, green: 246 / 255, blue: 246 / 255).edgesIgnoringSafeArea(.all)
                
                Form {
                    Section {
                        mineMessageView
                    }
                    Section {
                        listItemView(itemImage: "lock", itemName: "账号绑定", itemContent: "已绑定")
                        listItemView(itemImage: "gear.circle", itemName: "通用设置", itemContent: "")
                        listItemView(itemImage: "briefcase", itemName: "简历管理", itemContent: "未上传")
                        listItemView(itemImage: "icloud.and.arrow.down", itemName: "版本更新", itemContent: "Version 6.2.8")
                        listItemView(itemImage: "leaf", itemName: "清理缓存", itemContent: "0.00MB")
                        listItemView(itemImage: "person", itemName: "关于我", itemContent: "")
                    }
                    Section {
                        signOutView
                    }
                }
            }
            .navigationBarTitle("设置", displayMode: .inline)
            .navigationBarItems(leading: backToMineView)
        }
    }
    
    // 返回上一页
    private var backToMineView: some View {
        Button(action: {
        }) {
            Image(systemName: "arrow.backward")
                .foregroundColor(.black)
        }
    }
    
    // 个人信息
    private var mineMessageView: some View {
        Button(action: {
        }) {
            HStack(spacing: 15) {
                Image("美食1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(.systemGray5), lineWidth: 1))
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("jinliang")
                        .font(.system(size: 17))
                        .foregroundColor(.primary)
                    Text("iOS 程序员")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 10)
        }
    }
    
    // 退出登录
    private var signOutView: some View {
        Button(action: {
        }) {
            Text("退出登录")
                .font(.system(size: 17))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30, maxHeight: 30)
                .foregroundColor(.red)
                .cornerRadius(8)
                .padding(.vertical, 5)
        }
    }
    
    // MARK: 栏目结构
    struct listItemView: View {
        var itemImage: String
        var itemName: String
        var itemContent: String
        var body: some View {
            Button(action: {
            }) {
                HStack {
                    Image(systemName: itemImage)
                        .font(.system(size: 17))
                        .foregroundColor(.primary)
                    Text(itemName)
                        .foregroundColor(.primary)
                        .font(.system(size: 17))
                    Spacer()
                    Text(itemContent)
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                }.padding(.vertical, 15)
            }
        }
    }
}

struct ListSetting_Previews: PreviewProvider {
    static var previews: some View {
        ListSetting()
    }
}
