//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct Sections: Identifiable {
    var id = UUID()
    var title: String
    var image: Image
    var color: Color
}

let sectionData = [
    
    Sections(title: "蘑菇炒豆角", image: Image(uiImage: #imageLiteral(resourceName: "4.png")), color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))),
    Sections(title: "腊肠炒白菜", image: Image(uiImage: #imageLiteral(resourceName: "1.png")), color: Color(#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1))),
    Sections(title: "大葱豆腐",image:Image(uiImage: #imageLiteral(resourceName: "2.png")), color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))),
    Sections(title: "鱼香肉丝", image: Image(uiImage: #imageLiteral(resourceName: "3.png")), color: Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))),
    Sections(title: "香菇鸡肉", image: Image(uiImage: #imageLiteral(resourceName: "5.png")), color: Color(#colorLiteral(red: 0.3538610262, green: 0.6242842952, blue: 0.6906747523, alpha: 1)))
]


struct ContentView: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("美食菜单")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees:
                                    Double(geometry.frame(in: .global).minX - 30) / -20
                                ), axis: (x: 0, y: 10, z: 0))
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            Spacer()
        }
    }
}

struct SectionView: View {
    var section: Sections
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(section.title)
                .font(.system(size: 24, weight: .bold))
                .frame(width: 160, alignment: .leading)
                .foregroundColor(section.color)
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 275,height: 275)
                .cornerRadius(30)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 300, height: 300)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
