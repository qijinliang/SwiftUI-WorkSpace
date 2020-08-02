//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ConentView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                
                VStack {
                    Image.init(uiImage: #imageLiteral(resourceName: "赵小臭15.jpg"))
                        .resizable()
                        .scaledToFill()
                        .shadow(radius: 8)
                        .cornerRadius(10)
                        .frame(height: 300)
                }
            }
            .clipShape(CustomShape(corner: .bottomLeft, radii: 55))
            .clipShape(CustomShape(corner: .bottomRight, radii: 55))
            
            Spacer()
            
            VStack {
                VStack {
                    HStack(spacing: 10) {
                        Button(action: {
                            
                        }) {
                            VStack {
                                Text("22 W")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                            }.padding()
                            
                        }
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(12)
                        
                        Button(action: {
                            
                        }) {
                            VStack {
                                Text("22 W")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                            }.padding()
                            
                        }
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(12)
                        
                        Button(action: {
                            
                        }) {
                            VStack {
                                Text("22 W")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                            }.padding()
                            
                        }
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(12)
                        
                        Button(action: {
                            
                        }) {
                            VStack {
                                Text("22 W")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                            }.padding()
                            
                        }
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(12)
                        
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 25)
                }.padding()
            }
            
            HStack {
                Text("$12.4")
                    .foregroundColor(Color.black)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image.init(uiImage: #imageLiteral(resourceName: "cart.png"))
                        .renderingMode(.original)
                        .padding()
                }.background(Color.yellow)
                    .clipShape(Circle())
            }.padding()
                .background(Color.white)
        }
    }
}

//扩展
struct CustomShape: Shape {
    var corner: UIRectCorner
    var radii: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        return Path(path.cgPath)
    }
}
PlaygroundPage.current.setLiveView(ConentView())
//: [Next](@next)
