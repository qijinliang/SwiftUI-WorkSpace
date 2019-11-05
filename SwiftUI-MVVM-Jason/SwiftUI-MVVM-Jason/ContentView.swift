//
//  ContentView.swift
//  SwiftUI-MVVM-Jason
//
//  Created by Jerry on 2019/11/5.
//  Copyright © 2019 QijinLiang. All rights reserved.
//

import SwiftUI

let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"

//定义模型
struct Course: Identifiable, Decodable{
    let id = UUID()
    let name: String
    let price: Int
}


class CoursesViewModel: ObservableObject {
    //测试数据
    @Published var courses: [Course] = [
        .init(name: "Course 1",price: 0),
        .init(name: "Course 2",price: 0),
        .init(name: "Course 3",price: 0)
    ]
    //网络请求方法
    func fetchCourses() {
        //判断地址是否请求成功
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) {(data, resp, err) in
            DispatchQueue.main.async {
                do {
                    //模型转换
                    self.courses = try JSONDecoder().decode([Course].self, from:data!)
                    print("打印JSONDecoder->",try JSONDecoder().decode([Course].self, from: data!))
                } catch {
                    
                }
            }
            
        }.resume()
    }
}


struct ContentView: View {
    //加载模型
    @ObservedObject var coursesVM = CoursesViewModel()
    
    var body: some View {
        //设置导航栏
        NavigationView {
            //添加滚动视图
            ScrollView {
                //列表文字左边对齐
                VStack(alignment: .leading) {
                    //遍历模型
                    ForEach(coursesVM.courses) { course in
                        HStack {
                            Text(course.name)
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                            Spacer()
                            
                        }.padding(.bottom, 4)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("设备UUID: $\(course.id)")
                                .padding(.bottom, 5)
                                Text("Price: $\(course.price)")
                                .padding(.bottom, 5)
                            }
           
                            Spacer()
                            Text("作者: 最看红尘这场梦").foregroundColor(Color.red).font(.system(size: 14))
                            .padding(.bottom, 16)
                        }.padding(.bottom, 4)

                    }
                }.padding(.horizontal, 22)
                    .padding(.top, 8)
                
            //列表的标题
            }.navigationBarTitle("Courses")
            //导航栏按钮的点击事件
            .navigationBarItems(trailing: Button(action: {
                print("请求成功")
                //请求网络
                self.coursesVM.fetchCourses()
                
            }, label: {
                //导航栏的标题
                Text("Fetch Courses")
            }))
        }
    }
}
