//
//  DefinedSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/12.
//

import SwiftUI

struct DefinedSwiftUIView: View {
    var body: some View {
        ZStack {
            Image.init(uiImage: #imageLiteral(resourceName: "胡歌3"))
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                ZStack(alignment: .top) {
                    VStack{
                        HStack {
                            VStack(alignment: .leading, spacing: 10){
                                Text("Bella.").font(.title)
                                Text("23")
                            }
                            .padding()
                            Spacer()
                            HStack(spacing: 8){
//                                Image.init(uiImage: #imageLiteral(resourceName: "胡歌3")).resizable().frame(width: 15, height: 20)
                                
                                Text("8 Miles")
                                
                            }.padding(8)
                                .background(Color.black.opacity(0.1))
                                .cornerRadius(10)
                        }
                        .padding(.top, 35)
                        VStack{
                            Text("Hi! My name is Bella. I live in New Orleans. I love traveling and adventure. I like sharing my thoughts and adore people who except me the way I am. I see the world in different a way and I m always positive.")
                        }.padding()
                        
                    }.padding()
                        .background(BlurView())
                        .clipShape(BottomShape())
                        .cornerRadius(25)
                    
                    ZStack{
                        
                        Button(action: {
                            
                        }) {
                            
//                            Image.init(uiImage: #imageLiteral(resourceName: "胡歌1")).renderingMode(.original).resizable()
//                                .frame(width: 20, height: 20)
//                                .padding(20)
//                                .background(Color.white)
//                                .clipShape(Circle())
                        }
                        
                        Circle().stroke(Color.yellow, lineWidth: 5).frame(width: 70, height: 70)
                        
                    }.offset(y: -35)
                    
                    HStack{
                        
                        Button(action: {
                            
                        }) {
                            
//                            Image.init(uiImage: #imageLiteral(resourceName: "胡歌2")).renderingMode(.original).resizable()
//                                .frame(width: 25, height: 20)
//                                .padding()
//                                .background(Color.white)
//                                .clipShape(Circle())
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image.init(uiImage: #imageLiteral(resourceName: "胡歌1")).renderingMode(.original).resizable()
                                .frame(width: 25, height: 25)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                    }.offset(y: -25)
                        .padding(.horizontal,35)
                }
            }.padding()
        }
    }
}

struct BottomShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addArc(center: CGPoint(x: rect.width / 2, y: 0), radius: 42, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
            
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
