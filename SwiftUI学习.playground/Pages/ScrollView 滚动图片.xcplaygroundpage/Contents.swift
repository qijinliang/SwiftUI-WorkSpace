//: [Previous](@previous)


//#imageLiteral(resourceName: "1.jpg")
import SwiftUI
import PlaygroundSupport

struct picutremodel: Identifiable,Hashable {
    let id = UUID.init()
    let name: String
    let picutreName: UIImage
}

struct ContentView: View {
    
    let picutremodels : [[picutremodel]] = [
        [.init(name: "名字", picutreName: #imageLiteral(resourceName: "1.jpg")),.init(name: "名字2", picutreName: #imageLiteral(resourceName: "2.jpg"))],
        [.init(name: "名字3", picutreName: #imageLiteral(resourceName: "3.jpg"))]
    ]
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack {
                HStack {
                    Text("图片加载")
                        .font(.system(size: 20, weight: .semibold))
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 50) {
                        
                        ForEach(self.picutremodels, id: \.self) { row in
                            HStack(spacing: 50) {
                                ForEach(row) { picutremodel in
                                    PicutreView(models: picutremodel, size: geo.size)
                                }
                            }
                        }
                        Spacer()
                    }.padding(.horizontal, 16)
                }
            }
        }
        
    }
}

struct PicutreView: View {
    
    let models: picutremodel
    let size: CGSize
    
    var body: some View {
        VStack(spacing: 5) {
            Text(self.models.name)
            
            Image(uiImage: self.models.picutreName)
                .resizable()
                .scaledToFill()
                .cornerRadius(8)
                .shadow(radius: 10)
                .frame(width: 200, height: 400)
        }
        .padding()
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
