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
    Update(image: "Illustration1", title: "SwiftUI", text: "Learn how to build custom views and controls in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper understanding of the layout system of SwiftUI.", date: "JUN 26"),
    Update(image: "Illustration2", title: "Framer X", text: "Learn how to build custom views and controls in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper understanding of the layout system of SwiftUI.", date: "JUN 11"),
    Update(image: "Illustration3", title: "CSS Layout", text: "Learn how to combine CSS Grid, Flexbox, animations and responsive design to create a beautiful prototype in CodePen.", date: "MAY 26"),
    Update(image: "Illustration4", title: "React Native Part 2", text: "Learn how to implement gestures, Lottie animations and Firebase login.", date: "MAY 15"),
    Update(image: "Certificate1", title: "Unity", text: "Unity course teaching basics, C#, assets, level design and gameplay", date: "MAR 19"),
    Update(image: "Certificate2", title: "React Native for Designers", text: "Build your own iOS and Android app with custom animations, Redux and API data.", date: "FEB 14"),
    Update(image: "Certificate3", title: "Vue.js", text: "Make a dashboard web-app with a complete login system, dark mode, and animated charts for your data.", date: "JAN 23")
]
