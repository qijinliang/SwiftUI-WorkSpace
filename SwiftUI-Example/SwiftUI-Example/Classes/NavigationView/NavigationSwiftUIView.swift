//
//  NavigationSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/11.
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
    Update(image: #imageLiteral(resourceName: "赵小臭2"), title: "刘亦菲", text: "刘亦菲，1987年8月25日出生于湖北省武汉市，华语影视女演员、歌手，毕业于北京电影学院2002级表演系本科。 ", date: "1月17号"),
    Update(image: #imageLiteral(resourceName: "胡歌3"), title: "胡歌", text: "胡歌，1982年9月20日出生于上海市徐汇区，中国内地男演员、歌手，民盟盟员。", date: "8月9号"),
    Update(image: #imageLiteral(resourceName: "胡歌1"), title: "霍建华", text: "霍建华（Wallace Huo），1979年12月26日出生于台湾省台北市，祖籍山东烟台龙口，华语影视男演员、歌手、出品人", date: "12月27号"),
    Update(image: #imageLiteral(resourceName: "赵小臭1"), title: "汪苏泷（Silence）", text: "汪苏泷（Silence），1989年9月17日出生于辽宁省沈阳市，毕业于沈阳音乐学院作曲系，中国内地唱作男歌手、音乐人", date: "10月26号"),
    Update(image: #imageLiteral(resourceName: "胡歌2"), title: "周杰伦（Jay Chou）", text: "周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，祖籍福建省泉州市永春县，中国台湾流行乐男歌手、原创音乐人、演员、导演等，毕业于淡江中学", date: "9月11号")
]


class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}

struct NavigationSwiftUIView: View {
    
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(image: #imageLiteral(resourceName: "赵小臭1"), title: "周杰伦（Jay Chou）", text: "周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，祖籍福建省泉州市永春县，中国台湾流行乐男歌手、原创音乐人、演员、导演等，毕业于淡江中学", date: "9月11号"))
    }
    
    var body: some View {
        NavigationView {
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
        }
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
