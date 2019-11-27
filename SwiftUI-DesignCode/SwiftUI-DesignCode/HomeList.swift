//
//  HomeList.swift
//  SwiftUI-DesignCode
//
//  Created by Jerry on 2019/11/26.
//  Copyright © 2019 QijinLiang. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    
    var courses = coursesData
    @State var showContent = false
    
    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text("卡片项目标题")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text("卡片项目副标题")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.leading ,60.0)
                
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(courses) { item in
                            Button(action: {self.showContent.toggle()}) {
                                GeometryReader { geometry in
                                    CourseView(title: item.title, image: item.image, color: item.color, shadowColor: item.shadowColor)
                                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / 40), axis: (x: 0, y: 10.0, z: 0))
                                        .sheet(isPresented: self.$showContent) { ContentView() }
                                }
                                .frame(width: 246, height: 360)
                            }
                        }
                    }
                    .padding(.leading,30)
                    .padding(.top,30)
                    .padding(.bottom,70)
                    Spacer()
                }
                CertificateRow()
            }
            .padding(.top, 78
            )
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    
    var title = "Build an app with SwiftUI"
    var image = "Illustration1"
    var color = Color("background3")
    var shadowColor = Color("backgroundShadow3")
    
    var body: some View {
        return VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(30)
                .lineLimit(4)
            
            Spacer()
            
            Image(image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom, 30)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let coursesData = [
    Course(title: "用SwiftUI创建一个应用程序",
           image: "Illustration1",
           color: Color("background3"),
           shadowColor: Color("backgroundShadow3")),
    Course(title: "设计和动画您的UI",
           image: "Illustration2",
           color: Color("background4"),
           shadowColor: Color("backgroundShadow4")),
    Course(title: "最新SwiftUI",
           image: "Illustration3",
           color: Color("background7"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(title: "筹划者练习场",
           image: "Illustration4",
           color: Color("background8"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(title: "Flutter 设计师",
           image: "Illustration5",
           color: Color("background9"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
]
