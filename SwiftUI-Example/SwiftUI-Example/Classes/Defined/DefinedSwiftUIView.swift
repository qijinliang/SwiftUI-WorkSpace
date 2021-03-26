//
//  DefinedSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/12.
//

import SwiftUI

struct DefinedSwiftUIView: View {
    var body: some View {
        ZStack {
            Image.init(uiImage: #imageLiteral(resourceName: "赵小臭2"))
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                    VStack{
                        Text("胡歌，1982年9月20日出生于上海市徐汇区，中国内地影视男演员、流行乐歌手，民盟盟员 [1]  ，毕业于上海戏剧学院表演系。1996年，14岁的胡歌便成为上海教育电视台的小主持人。")
                            .font(.title)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(BlurView())
            }
        }
    }
}
struct BlurView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIVisualEffectView{
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialLight))
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<BlurView>) {
        
    }
}

struct DefinedSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DefinedSwiftUIView()
    }
}
