//
//  ScrollView2SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/7/03.
//

import SwiftUI

struct ScrollViewFoodView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack() {
                Group() {
                    FoodCardView(image: "美食6",heading: "啤酒小龙虾", explain:"啤酒小龙虾是用龙虾、啤酒制作的一道家常菜。小龙虾中含有丰富的镁，镁对心脏活动具有重要的调节作用，能很好的保护心血管系统，它可减少血液中胆固醇含量，防止动脉硬化，同时还能扩张冠状动脉，有利于预防高血压及心肌梗死。")
                    FoodCardView(image: "美食1",heading: "黄焖鸡", explain:"黄焖鸡米饭又叫香鸡煲、浓汁鸡煲饭，属于鲁菜系家常菜品，起源于山东省济南市。主要食材是鸡腿肉，配以青椒、土豆、香菇等焖制而成，味道美妙，具有肉质鲜美嫩滑的特点。")
                    FoodCardView(image: "美食8",heading: "辣子鸡", explain:"辣子鸡块是四川风味名菜，属于川菜。用鸡脯肉加辣椒炒制而成。泡红辣椒是四川特产，为川菜的特有的调味料，色鲜亮、入口香嫩，同时花生香脆，新鲜微咸。")
                    FoodCardView(image: "美食2",heading: "香菇炖肉", explain:"香菇富含着很多人体所需的营养成份！ 香菇，又名香蕈、冬菇，是一种生长在木材上的真菌类，在我国已有4000多年的食用历史。")
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct FoodCardView: View {
    
    var image: String
    var heading: String
    var explain: String
    
    var body: some View {
        VStack() {
            Image.init(image).resizable()
                .aspectRatio(contentMode: .fit)
            HStack() {
                VStack(alignment: .leading, spacing: 10) {
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    
                    Text(explain.uppercased())
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255,green: 150/255, blue: 150/255, opacity: 0.1),lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct ScrollViewFoodView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewFoodView().preferredColorScheme(.dark)
    }
}
