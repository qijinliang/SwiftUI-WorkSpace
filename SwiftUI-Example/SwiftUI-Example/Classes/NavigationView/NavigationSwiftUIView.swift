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
    Update(image: #imageLiteral(resourceName: "赵小臭1"), title: "赵小臭", text: "赵小臭是一名主播，兼具娱乐和游戏功底。赵小臭清纯的面容加上唱歌功底，邻家妹妹的形象受到观众的喜欢。", date: "1月17号"),
    Update(image: #imageLiteral(resourceName: "胡歌3"), title: "胡歌", text: "胡歌，1982年9月20日出生于上海市徐汇区，中国内地影视男演员、流行乐歌手，民盟盟员 [1]  ，毕业于上海戏剧学院表演系。1996年，14岁的胡歌便成为上海教育电视台的小主持人。2005年在仙侠剧《仙剑奇侠传》中塑造了“李逍遥”一角，并演唱该剧插曲《六月的雨》《逍遥叹》 [2-3]  。2006年8月遭受严重车祸，2007年6月复出 [4]  。2009年主演仙侠剧《仙剑奇侠传三》 [5]  ，并演唱片尾曲《忘记时间》 [6]  。2010年主演的穿越剧《神话》在央视八套播出 [7]  。2011年参演历史题材电影《辛亥革命》提名大众电影百花奖“最佳新人奖” [8-9]  。2012年主演玄幻剧《轩辕剑之天之痕》 [10]  。2013年主演两部话剧，凭借《如梦之梦》获得北京丹尼国际舞台表演艺术奖“最佳男演员奖” [11]  ；2014年参演战争剧《四十九日·祭》提名上海电视节白玉兰奖“最佳男配角奖” [12-13]  ；2015年主演的谍战剧《伪装者》、古装剧《琅琊榜》、都市剧《大好时光》相继播出，获中国电视剧飞天奖“优秀男演员提名奖”、上海电视节白玉兰奖“最佳男主角奖”、中国电视金鹰奖“观众喜爱的男演员奖”、中国金鹰电视艺术节“最具人气男演员奖”等奖项 [14-18]  。2016年登上央视春晚演唱歌曲《相亲相爱》 [19-20]  。2017年二度登上央视春晚演唱歌曲《在此刻》，获得共青团中央“全国向上向善好青年”崇义友善好青年称号，2018年凭借《猎场》二度提名上海电视节白玉兰奖“最佳男主角奖” [21-24]  。", date: "8月9号"),
    Update(image: #imageLiteral(resourceName: "赵小臭2"), title: "赵小臭", text: "赵小臭是一名主播，兼具娱乐和游戏功底。赵小臭清纯的面容加上唱歌功底，邻家妹妹的形象受到观众的喜欢。", date: "12月27号"),
    Update(image: #imageLiteral(resourceName: "placeholder"), title: "胡歌", text: "胡歌，1982年9月20日出生于上海市徐汇区，中国内地影视男演员、流行乐歌手，民盟盟员 [1]  ，毕业于上海戏剧学院表演系。1996年，14岁的胡歌便成为上海教育电视台的小主持人。2005年在仙侠剧《仙剑奇侠传》中塑造了“李逍遥”一角，并演唱该剧插曲《六月的雨》《逍遥叹》 [2-3]  。2006年8月遭受严重车祸，2007年6月复出 [4]  。2009年主演仙侠剧《仙剑奇侠传三》 [5]  ，并演唱片尾曲《忘记时间》 [6]  。2010年主演的穿越剧《神话》在央视八套播出 [7]  。2011年参演历史题材电影《辛亥革命》提名大众电影百花奖“最佳新人奖” [8-9]  。2012年主演玄幻剧《轩辕剑之天之痕》 [10]  。2013年主演两部话剧，凭借《如梦之梦》获得北京丹尼国际舞台表演艺术奖“最佳男演员奖” [11]  ；2014年参演战争剧《四十九日·祭》提名上海电视节白玉兰奖“最佳男配角奖” [12-13]  ；2015年主演的谍战剧《伪装者》、古装剧《琅琊榜》、都市剧《大好时光》相继播出，获中国电视剧飞天奖“优秀男演员提名奖”、上海电视节白玉兰奖“最佳男主角奖”、中国电视金鹰奖“观众喜爱的男演员奖”、中国金鹰电视艺术节“最具人气男演员奖”等奖项 [14-18]  。2016年登上央视春晚演唱歌曲《相亲相爱》 [19-20]  。2017年二度登上央视春晚演唱歌曲《在此刻》，获得共青团中央“全国向上向善好青年”崇义友善好青年称号，2018年凭借《猎场》二度提名上海电视节白玉兰奖“最佳男主角奖” [21-24]  。", date: "8月9号"),
    Update(image: #imageLiteral(resourceName: "胡歌1"), title: "胡歌", text: "胡歌，1982年9月20日出生于上海市徐汇区，中国内地影视男演员、流行乐歌手，民盟盟员 [1]  ，毕业于上海戏剧学院表演系。1996年，14岁的胡歌便成为上海教育电视台的小主持人。2005年在仙侠剧《仙剑奇侠传》中塑造了“李逍遥”一角，并演唱该剧插曲《六月的雨》《逍遥叹》 [2-3]  。2006年8月遭受严重车祸，2007年6月复出 [4]  。2009年主演仙侠剧《仙剑奇侠传三》 [5]  ，并演唱片尾曲《忘记时间》 [6]  。2010年主演的穿越剧《神话》在央视八套播出 [7]  。2011年参演历史题材电影《辛亥革命》提名大众电影百花奖“最佳新人奖” [8-9]  。2012年主演玄幻剧《轩辕剑之天之痕》 [10]  。2013年主演两部话剧，凭借《如梦之梦》获得北京丹尼国际舞台表演艺术奖“最佳男演员奖” [11]  ；2014年参演战争剧《四十九日·祭》提名上海电视节白玉兰奖“最佳男配角奖” [12-13]  ；2015年主演的谍战剧《伪装者》、古装剧《琅琊榜》、都市剧《大好时光》相继播出，获中国电视剧飞天奖“优秀男演员提名奖”、上海电视节白玉兰奖“最佳男主角奖”、中国电视金鹰奖“观众喜爱的男演员奖”、中国金鹰电视艺术节“最具人气男演员奖”等奖项 [14-18]  。2016年登上央视春晚演唱歌曲《相亲相爱》 [19-20]  。2017年二度登上央视春晚演唱歌曲《在此刻》，获得共青团中央“全国向上向善好青年”崇义友善好青年称号，2018年凭借《猎场》二度提名上海电视节白玉兰奖“最佳男主角奖” [21-24]  。", date: "8月9号"),
]


class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}

struct NavigationSwiftUIView: View {
    
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(image: #imageLiteral(resourceName: "赵小臭1"), title: "赵小臭", text: "赵小臭是一名主播，兼具娱乐和游戏功底。赵小臭清纯的面容加上唱歌功底，邻家妹妹的形象受到观众的喜欢。", date: "12月27号"))
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
