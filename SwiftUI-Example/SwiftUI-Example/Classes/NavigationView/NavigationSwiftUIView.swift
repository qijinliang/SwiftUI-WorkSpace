//
//  NavigationSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/11.
//

import SwiftUI

import Combine

struct Update: Identifiable {
    var id = UUID()
    var image: UIImage
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: #imageLiteral(resourceName: "张妍1"), title: "张妍", text: "张妍是一名主播，兼具娱乐和游戏功底。张妍清纯的面容加上唱歌功底，邻家妹妹的形象受到观众的喜欢。", date: "1月17号"),
    Update(image: #imageLiteral(resourceName: "胡歌3"), title: "胡歌", text: "胡歌，1982年9月20日出生于上海市徐汇区，中国内地影视男演员、流行乐歌手", date: "8月9号"),
    Update(image: #imageLiteral(resourceName: "张妍2"), title: "张妍", text: "张妍是一名主播，兼具娱乐和游戏功底。张妍清纯的面容加上唱歌功底，邻家妹妹的形象受到观众的喜欢。", date: "12月27号"),
    Update(image: #imageLiteral(resourceName: "张妍4"), title: "张妍", text: "张妍是一名主播，兼具娱乐和游戏功底。张妍清纯的面容加上唱歌功底，邻家妹妹的形象受到观众的喜欢。", date: "12月27号"),
    Update(image: #imageLiteral(resourceName: "张妍6"), title: "张妍", text: "张妍是一名主播，兼具娱乐和游戏功底。张妍清纯的面容加上唱歌功底，邻家妹妹的形象受到观众的喜欢。", date: "12月27号"),
    Update(image: #imageLiteral(resourceName: "张妍3"), title: "张妍", text: "张妍是一名主播，兼具娱乐和游戏功底。张妍清纯的面容加上唱歌功底，邻家妹妹的形象受到观众的喜欢。", date: "12月27号")
]


class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}

struct NavigationSwiftUIView: View {
    
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(image: #imageLiteral(resourceName: "张妍5"), title: "张妍", text: "张妍是一名主播，兼具娱乐和游戏功底。张妍清纯的面容加上唱歌功底，邻家妹妹的形象受到观众的喜欢。", date: "12月27号"))
    }
    
    var body: some View {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) {
                        HStack {
                            Image(uiImage: update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .cornerRadius(80)
                                .padding(.trailing, 4)
                            
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete{ index in
                    self.store.updates.remove(at: index.first!)
                }
                .onMove{(source: IndexSet, destination: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationBarTitle(Text("明星介绍"))
            .navigationBarItems(leading: Button(action: addUpdate) {
                Text("添加")
            },trailing: EditButton())
        .edgesIgnoringSafeArea(.all)
    }
}


struct UpdateDetail: View {
    var update: Update = updateData[1]
    var body: some View{
        List {
            VStack(spacing: 20) {
                Image(uiImage: update.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                Text(update.text)
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
            }
            .navigationBarTitle(update.title)
        }
        .listStyle(PlainListStyle())
    }
}

struct NavigationSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSwiftUIView().preferredColorScheme(.dark)
    }
}
